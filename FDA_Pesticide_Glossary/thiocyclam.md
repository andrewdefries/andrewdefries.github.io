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
-2.781014, -2.072798, -2.946586, 1, 0, 0, 1,
-2.720999, 0.5684631, -2.174164, 1, 0.007843138, 0, 1,
-2.671989, 0.8001861, 0.02330723, 1, 0.01176471, 0, 1,
-2.608613, 0.8767152, -0.4630835, 1, 0.01960784, 0, 1,
-2.554665, 0.7664136, -3.529477, 1, 0.02352941, 0, 1,
-2.541409, 2.948716, -0.552339, 1, 0.03137255, 0, 1,
-2.46903, 0.009458876, -3.358201, 1, 0.03529412, 0, 1,
-2.436356, -0.8752155, -1.69127, 1, 0.04313726, 0, 1,
-2.405869, 0.6683155, -2.114138, 1, 0.04705882, 0, 1,
-2.384126, 0.137656, -1.776912, 1, 0.05490196, 0, 1,
-2.337755, -0.8618734, -0.3154225, 1, 0.05882353, 0, 1,
-2.294323, 1.147977, -2.26888, 1, 0.06666667, 0, 1,
-2.279302, 0.07619579, -1.004228, 1, 0.07058824, 0, 1,
-2.274309, 1.466748, -2.415431, 1, 0.07843138, 0, 1,
-2.245764, -0.1992178, -1.784224, 1, 0.08235294, 0, 1,
-2.229693, 0.7662467, -0.3971874, 1, 0.09019608, 0, 1,
-2.227535, -0.8759257, -2.433293, 1, 0.09411765, 0, 1,
-2.223132, 1.071772, -2.529007, 1, 0.1019608, 0, 1,
-2.213069, -2.169829, -2.60562, 1, 0.1098039, 0, 1,
-2.176292, -0.02309046, -1.212757, 1, 0.1137255, 0, 1,
-2.149818, 0.03745665, -0.4760573, 1, 0.1215686, 0, 1,
-2.119807, 1.612788, 0.869457, 1, 0.1254902, 0, 1,
-2.086838, -0.9206196, -1.554007, 1, 0.1333333, 0, 1,
-2.057602, -1.032826, -2.575774, 1, 0.1372549, 0, 1,
-2.054969, 1.345596, -0.6065326, 1, 0.145098, 0, 1,
-2.054744, 0.5617885, 0.1538002, 1, 0.1490196, 0, 1,
-2.029093, -0.0202043, -2.068034, 1, 0.1568628, 0, 1,
-2.004308, -0.8544698, -0.4003634, 1, 0.1607843, 0, 1,
-1.992961, -0.2554529, -3.000486, 1, 0.1686275, 0, 1,
-1.979149, -0.7185017, -0.8824311, 1, 0.172549, 0, 1,
-1.9192, 0.1854489, -1.387965, 1, 0.1803922, 0, 1,
-1.911782, 1.546499, -0.7577715, 1, 0.1843137, 0, 1,
-1.907688, -0.1744849, -0.7361335, 1, 0.1921569, 0, 1,
-1.870143, 0.4278267, -1.181836, 1, 0.1960784, 0, 1,
-1.852666, 0.2306853, -1.989351, 1, 0.2039216, 0, 1,
-1.849962, -0.0771558, -3.559108, 1, 0.2117647, 0, 1,
-1.848786, 1.257468, -0.5800814, 1, 0.2156863, 0, 1,
-1.826891, 0.1773331, -0.7134902, 1, 0.2235294, 0, 1,
-1.7519, 0.05692685, -0.9860148, 1, 0.227451, 0, 1,
-1.735727, 0.4494371, -1.742111, 1, 0.2352941, 0, 1,
-1.715462, -1.036796, -2.260036, 1, 0.2392157, 0, 1,
-1.705806, -1.8839, -2.482593, 1, 0.2470588, 0, 1,
-1.689738, 1.859388, 0.6525812, 1, 0.2509804, 0, 1,
-1.678948, -0.7657231, -3.23135, 1, 0.2588235, 0, 1,
-1.670108, 0.2204863, -0.4844808, 1, 0.2627451, 0, 1,
-1.666577, -0.1165782, -1.619677, 1, 0.2705882, 0, 1,
-1.663974, -1.899598, -3.487741, 1, 0.2745098, 0, 1,
-1.638657, -0.9463345, -2.445798, 1, 0.282353, 0, 1,
-1.636351, -0.8655102, -2.433221, 1, 0.2862745, 0, 1,
-1.626458, 0.0202129, -0.8857328, 1, 0.2941177, 0, 1,
-1.607937, 0.6882918, -3.529574, 1, 0.3019608, 0, 1,
-1.592649, -0.6065419, -0.411268, 1, 0.3058824, 0, 1,
-1.586709, -0.7382967, -2.764224, 1, 0.3137255, 0, 1,
-1.573055, 0.06014595, -1.604412, 1, 0.3176471, 0, 1,
-1.563933, -0.9334704, -3.273787, 1, 0.3254902, 0, 1,
-1.544912, 0.9036536, -1.128812, 1, 0.3294118, 0, 1,
-1.534362, -0.4193887, -2.496238, 1, 0.3372549, 0, 1,
-1.531271, 0.01000093, -2.44338, 1, 0.3411765, 0, 1,
-1.526784, -0.4392913, -1.619838, 1, 0.3490196, 0, 1,
-1.525107, -0.3545725, -1.390565, 1, 0.3529412, 0, 1,
-1.521786, -0.6300099, -1.534252, 1, 0.3607843, 0, 1,
-1.515581, -0.5415403, -1.97741, 1, 0.3647059, 0, 1,
-1.4683, 1.295737, -0.06860168, 1, 0.372549, 0, 1,
-1.467913, -1.152642, -3.015285, 1, 0.3764706, 0, 1,
-1.449561, -0.3834291, -1.837994, 1, 0.3843137, 0, 1,
-1.420059, 1.810775, -1.298774, 1, 0.3882353, 0, 1,
-1.409811, 0.7703543, -1.748002, 1, 0.3960784, 0, 1,
-1.398355, -2.233102, -1.609341, 1, 0.4039216, 0, 1,
-1.395481, 0.6483519, -1.929983, 1, 0.4078431, 0, 1,
-1.39473, 0.9335916, -0.9389803, 1, 0.4156863, 0, 1,
-1.387248, -1.257101, -2.48728, 1, 0.4196078, 0, 1,
-1.384261, 0.8570879, 0.08618899, 1, 0.427451, 0, 1,
-1.371442, -0.4865678, -1.477155, 1, 0.4313726, 0, 1,
-1.369206, -0.3429135, -2.988017, 1, 0.4392157, 0, 1,
-1.360111, -1.637492, -1.761227, 1, 0.4431373, 0, 1,
-1.351752, -2.071103, -3.511937, 1, 0.4509804, 0, 1,
-1.350747, -0.2218489, -3.19369, 1, 0.454902, 0, 1,
-1.337269, 1.032038, 0.4064863, 1, 0.4627451, 0, 1,
-1.337051, 0.8487763, -0.6283053, 1, 0.4666667, 0, 1,
-1.332435, 0.7128279, -2.215747, 1, 0.4745098, 0, 1,
-1.313619, 0.7118679, -0.6872684, 1, 0.4784314, 0, 1,
-1.308073, 0.5533389, -1.706985, 1, 0.4862745, 0, 1,
-1.294233, 2.098776, -0.3623569, 1, 0.4901961, 0, 1,
-1.281356, -0.08797204, -0.7882552, 1, 0.4980392, 0, 1,
-1.280959, 0.1460866, -1.67625, 1, 0.5058824, 0, 1,
-1.263849, -0.3904332, -0.221794, 1, 0.509804, 0, 1,
-1.261004, 0.4710243, -1.175047, 1, 0.5176471, 0, 1,
-1.250398, 1.050956, -1.527643, 1, 0.5215687, 0, 1,
-1.245679, -1.6955, -3.450159, 1, 0.5294118, 0, 1,
-1.244807, 1.42228, 1.294494, 1, 0.5333334, 0, 1,
-1.243747, -1.037283, -3.723645, 1, 0.5411765, 0, 1,
-1.243317, 0.7733901, 0.7865387, 1, 0.5450981, 0, 1,
-1.23905, -0.7584329, -0.9632075, 1, 0.5529412, 0, 1,
-1.233237, 0.3181651, -0.03678349, 1, 0.5568628, 0, 1,
-1.231007, -0.7321404, -3.028005, 1, 0.5647059, 0, 1,
-1.227401, -1.317884, -1.879349, 1, 0.5686275, 0, 1,
-1.224344, 0.7852349, -0.06854025, 1, 0.5764706, 0, 1,
-1.208394, 1.274425, -0.04260986, 1, 0.5803922, 0, 1,
-1.199914, -0.04152406, -1.535203, 1, 0.5882353, 0, 1,
-1.182824, 0.8753485, -0.2163819, 1, 0.5921569, 0, 1,
-1.181679, 0.3671849, -1.804341, 1, 0.6, 0, 1,
-1.179186, 0.02478759, -3.400842, 1, 0.6078432, 0, 1,
-1.167432, 1.330052, -1.75887, 1, 0.6117647, 0, 1,
-1.167109, -0.8916658, -1.85818, 1, 0.6196079, 0, 1,
-1.147167, -0.6338653, -0.9554149, 1, 0.6235294, 0, 1,
-1.137277, 0.4602242, -0.8393757, 1, 0.6313726, 0, 1,
-1.134633, -0.619437, -2.238196, 1, 0.6352941, 0, 1,
-1.125404, 0.9114651, -0.9130881, 1, 0.6431373, 0, 1,
-1.124592, 0.01596505, -2.475504, 1, 0.6470588, 0, 1,
-1.119556, -1.251559, -3.309314, 1, 0.654902, 0, 1,
-1.083697, 1.579225, -1.536, 1, 0.6588235, 0, 1,
-1.076185, 0.7854098, -0.4410839, 1, 0.6666667, 0, 1,
-1.074672, -0.6062946, -2.176843, 1, 0.6705883, 0, 1,
-1.073411, 1.185799, 0.3398724, 1, 0.6784314, 0, 1,
-1.052976, 0.7471544, -2.556036, 1, 0.682353, 0, 1,
-1.031248, 0.7273556, -0.8222176, 1, 0.6901961, 0, 1,
-1.031109, 1.404927, -1.10987, 1, 0.6941177, 0, 1,
-1.024386, 0.2137291, -1.376478, 1, 0.7019608, 0, 1,
-1.021257, 1.511981, -0.3898588, 1, 0.7098039, 0, 1,
-1.017009, -1.551576, -2.887161, 1, 0.7137255, 0, 1,
-1.013932, -0.06092684, -1.146252, 1, 0.7215686, 0, 1,
-1.01137, 0.3900099, -1.260759, 1, 0.7254902, 0, 1,
-1.008948, -0.1348635, -2.510992, 1, 0.7333333, 0, 1,
-1.006387, -0.1305189, -2.730259, 1, 0.7372549, 0, 1,
-1.005261, -0.311876, -1.392901, 1, 0.7450981, 0, 1,
-1.00383, 1.096851, -0.887264, 1, 0.7490196, 0, 1,
-1.002041, 0.3035915, -1.659993, 1, 0.7568628, 0, 1,
-0.991338, 0.731739, -0.6363164, 1, 0.7607843, 0, 1,
-0.9896016, -0.2937399, -0.1839514, 1, 0.7686275, 0, 1,
-0.9878559, 0.7325872, 0.4475945, 1, 0.772549, 0, 1,
-0.9788876, 0.1043706, -1.684742, 1, 0.7803922, 0, 1,
-0.9783342, -0.3249296, -0.5788228, 1, 0.7843137, 0, 1,
-0.9736735, -1.071408, -2.771235, 1, 0.7921569, 0, 1,
-0.9717228, -0.04892731, -3.290168, 1, 0.7960784, 0, 1,
-0.9694766, 0.3536542, 0.5987151, 1, 0.8039216, 0, 1,
-0.9656406, -1.262608, -2.324438, 1, 0.8117647, 0, 1,
-0.9612669, 1.005955, -0.8719649, 1, 0.8156863, 0, 1,
-0.9612004, 0.4457669, -1.836228, 1, 0.8235294, 0, 1,
-0.9586502, 1.586539, 0.6918189, 1, 0.827451, 0, 1,
-0.9499109, -0.9632662, -3.350298, 1, 0.8352941, 0, 1,
-0.9459208, -1.558786, -1.323158, 1, 0.8392157, 0, 1,
-0.9440846, -0.9223371, -3.733216, 1, 0.8470588, 0, 1,
-0.9439422, -1.01346, -1.476621, 1, 0.8509804, 0, 1,
-0.9425522, 0.665428, -2.549144, 1, 0.8588235, 0, 1,
-0.9377078, -0.5204448, -1.064705, 1, 0.8627451, 0, 1,
-0.9357269, 1.204189, -1.544936, 1, 0.8705882, 0, 1,
-0.9355569, -0.1819102, -1.386158, 1, 0.8745098, 0, 1,
-0.9349625, -0.776663, -1.218361, 1, 0.8823529, 0, 1,
-0.9316859, 0.3331354, -1.574267, 1, 0.8862745, 0, 1,
-0.9304969, -0.3958444, -1.40878, 1, 0.8941177, 0, 1,
-0.9298014, -0.9267783, -1.286385, 1, 0.8980392, 0, 1,
-0.9285284, 0.7043159, -2.145578, 1, 0.9058824, 0, 1,
-0.926468, -0.4281873, -2.736296, 1, 0.9137255, 0, 1,
-0.9258496, 0.5815833, -2.470124, 1, 0.9176471, 0, 1,
-0.9201824, 0.7608818, -0.9479095, 1, 0.9254902, 0, 1,
-0.9176573, 1.288308, -0.3641197, 1, 0.9294118, 0, 1,
-0.9171301, -0.08947059, -2.060209, 1, 0.9372549, 0, 1,
-0.9159972, 2.125144, 0.5834179, 1, 0.9411765, 0, 1,
-0.9123103, 1.12067, -0.5948563, 1, 0.9490196, 0, 1,
-0.9088322, -1.185828, -2.808124, 1, 0.9529412, 0, 1,
-0.9017033, 0.5340164, -0.9239911, 1, 0.9607843, 0, 1,
-0.8969888, -0.8173886, -1.444149, 1, 0.9647059, 0, 1,
-0.8925326, -0.9775998, -3.800121, 1, 0.972549, 0, 1,
-0.8920426, -0.4449166, -1.588476, 1, 0.9764706, 0, 1,
-0.8886492, 0.6142312, -2.068881, 1, 0.9843137, 0, 1,
-0.8886406, -1.873701, -2.607116, 1, 0.9882353, 0, 1,
-0.8737556, -0.4313185, -1.361524, 1, 0.9960784, 0, 1,
-0.8716581, 0.6915184, -3.765227, 0.9960784, 1, 0, 1,
-0.8691818, -1.980366, -4.582037, 0.9921569, 1, 0, 1,
-0.8599114, -0.6054738, -1.594351, 0.9843137, 1, 0, 1,
-0.8587607, 0.5874188, -1.505135, 0.9803922, 1, 0, 1,
-0.8527848, 0.8623629, -1.635531, 0.972549, 1, 0, 1,
-0.849959, -0.4290343, -3.857775, 0.9686275, 1, 0, 1,
-0.8470316, 0.2522646, -1.098936, 0.9607843, 1, 0, 1,
-0.8465579, 0.6768563, -0.4885435, 0.9568627, 1, 0, 1,
-0.8418595, 0.848654, 0.1777835, 0.9490196, 1, 0, 1,
-0.8382954, 0.2579457, -1.923606, 0.945098, 1, 0, 1,
-0.8298196, -0.4373894, -1.352985, 0.9372549, 1, 0, 1,
-0.8294559, 0.007726606, -0.3791333, 0.9333333, 1, 0, 1,
-0.8228514, -0.1977583, -3.45419, 0.9254902, 1, 0, 1,
-0.822836, 1.147462, -2.93361, 0.9215686, 1, 0, 1,
-0.8171027, -1.105316, -3.208207, 0.9137255, 1, 0, 1,
-0.8164302, -0.5096204, 0.0500355, 0.9098039, 1, 0, 1,
-0.8113998, -0.4837195, -1.148149, 0.9019608, 1, 0, 1,
-0.8107648, 0.6073656, 0.6139022, 0.8941177, 1, 0, 1,
-0.8105109, 1.046002, 0.5485464, 0.8901961, 1, 0, 1,
-0.8104942, 0.4580652, -1.197294, 0.8823529, 1, 0, 1,
-0.8101779, 0.1169939, -1.801489, 0.8784314, 1, 0, 1,
-0.8083763, 0.2728044, -1.474897, 0.8705882, 1, 0, 1,
-0.8074065, 2.638352, 0.2104393, 0.8666667, 1, 0, 1,
-0.8065793, 1.17955, -0.3429749, 0.8588235, 1, 0, 1,
-0.8045005, 0.2148411, -2.285502, 0.854902, 1, 0, 1,
-0.7991081, 0.3649015, -1.051986, 0.8470588, 1, 0, 1,
-0.7958316, -0.4228888, -2.538557, 0.8431373, 1, 0, 1,
-0.7940934, 0.8360855, -2.61602, 0.8352941, 1, 0, 1,
-0.79394, 0.02364082, -1.279121, 0.8313726, 1, 0, 1,
-0.7916316, -0.0218994, -0.972156, 0.8235294, 1, 0, 1,
-0.7889743, 0.277371, -1.411503, 0.8196079, 1, 0, 1,
-0.787319, -0.1135392, -2.319061, 0.8117647, 1, 0, 1,
-0.7854568, -1.582255, -4.689, 0.8078431, 1, 0, 1,
-0.7846561, -0.6919265, -5.117919, 0.8, 1, 0, 1,
-0.7829414, -1.655835, -2.567253, 0.7921569, 1, 0, 1,
-0.78292, 1.131875, -1.977222, 0.7882353, 1, 0, 1,
-0.7825366, -0.9645451, -1.685729, 0.7803922, 1, 0, 1,
-0.7819741, -0.2495093, -0.5825487, 0.7764706, 1, 0, 1,
-0.7810438, -0.4610332, -2.092041, 0.7686275, 1, 0, 1,
-0.7658706, -0.1491308, -2.04137, 0.7647059, 1, 0, 1,
-0.7657562, 0.4017679, -1.743889, 0.7568628, 1, 0, 1,
-0.7623326, -0.08417786, 0.7226322, 0.7529412, 1, 0, 1,
-0.7573344, 0.4084529, -1.629991, 0.7450981, 1, 0, 1,
-0.7452876, -0.7232795, -1.994, 0.7411765, 1, 0, 1,
-0.7403644, -1.093903, -2.632034, 0.7333333, 1, 0, 1,
-0.7378076, 1.213199, -0.006926999, 0.7294118, 1, 0, 1,
-0.7306511, -0.6081165, -1.774011, 0.7215686, 1, 0, 1,
-0.729488, -0.1383314, -2.103368, 0.7176471, 1, 0, 1,
-0.7216141, -1.120715, -2.930252, 0.7098039, 1, 0, 1,
-0.7202114, -0.2563058, -2.210757, 0.7058824, 1, 0, 1,
-0.7190569, 0.4555901, -0.9252335, 0.6980392, 1, 0, 1,
-0.7189256, -0.462634, -1.89249, 0.6901961, 1, 0, 1,
-0.7181729, -0.67478, -1.836517, 0.6862745, 1, 0, 1,
-0.7136588, 0.549059, -1.599216, 0.6784314, 1, 0, 1,
-0.7080324, 2.47197, -1.445404, 0.6745098, 1, 0, 1,
-0.7064728, 1.522604, 1.217611, 0.6666667, 1, 0, 1,
-0.7016146, -1.971101, -2.918437, 0.6627451, 1, 0, 1,
-0.6982133, -0.6935713, -1.501865, 0.654902, 1, 0, 1,
-0.6978007, 1.200042, 0.5232505, 0.6509804, 1, 0, 1,
-0.6724628, -0.05745755, -2.075144, 0.6431373, 1, 0, 1,
-0.6642638, -0.1192695, 0.9408461, 0.6392157, 1, 0, 1,
-0.6593667, -1.613626, -2.432001, 0.6313726, 1, 0, 1,
-0.6576772, -0.3598437, -0.6578596, 0.627451, 1, 0, 1,
-0.6467234, 1.611656, 0.2852116, 0.6196079, 1, 0, 1,
-0.643972, -0.6555142, -1.396636, 0.6156863, 1, 0, 1,
-0.6405436, 0.2895899, -0.9800368, 0.6078432, 1, 0, 1,
-0.6358492, -0.2595508, -2.595515, 0.6039216, 1, 0, 1,
-0.6351407, -0.7192509, -2.752813, 0.5960785, 1, 0, 1,
-0.6305088, 1.258108, -0.008616031, 0.5882353, 1, 0, 1,
-0.6299302, 0.1610453, -0.03557007, 0.5843138, 1, 0, 1,
-0.6296837, 0.9773519, -1.238165, 0.5764706, 1, 0, 1,
-0.6263632, -0.651735, -1.092513, 0.572549, 1, 0, 1,
-0.620642, 0.9573344, -0.1437661, 0.5647059, 1, 0, 1,
-0.61869, -0.8563935, -3.143327, 0.5607843, 1, 0, 1,
-0.6121491, -0.3638307, -4.801105, 0.5529412, 1, 0, 1,
-0.6018621, -0.8827485, -0.1291062, 0.5490196, 1, 0, 1,
-0.5946263, 0.9145976, -0.2858036, 0.5411765, 1, 0, 1,
-0.5892942, -1.882991, -4.187959, 0.5372549, 1, 0, 1,
-0.5843183, 0.2578876, 0.6213772, 0.5294118, 1, 0, 1,
-0.580725, -0.4247977, -3.54358, 0.5254902, 1, 0, 1,
-0.5793467, -0.5943715, -3.069314, 0.5176471, 1, 0, 1,
-0.576219, 1.281344, 0.7718095, 0.5137255, 1, 0, 1,
-0.5738673, -0.05543659, -2.601129, 0.5058824, 1, 0, 1,
-0.5666991, -1.979281, -0.7599871, 0.5019608, 1, 0, 1,
-0.5650552, -1.215105, -0.8570913, 0.4941176, 1, 0, 1,
-0.5643166, -1.974275, -1.985947, 0.4862745, 1, 0, 1,
-0.5626696, 0.04106689, -2.753538, 0.4823529, 1, 0, 1,
-0.5615956, -0.3744535, -1.272238, 0.4745098, 1, 0, 1,
-0.5608914, -1.406251, -2.764082, 0.4705882, 1, 0, 1,
-0.5599807, 1.61667, 1.048759, 0.4627451, 1, 0, 1,
-0.5591579, -2.92737, -4.147826, 0.4588235, 1, 0, 1,
-0.5507579, 0.4400082, 0.136563, 0.4509804, 1, 0, 1,
-0.5499266, -0.6753003, -3.149902, 0.4470588, 1, 0, 1,
-0.5473337, 0.3346983, -0.3488129, 0.4392157, 1, 0, 1,
-0.5371068, 2.100725, 0.7380331, 0.4352941, 1, 0, 1,
-0.529586, -0.6271539, -1.312143, 0.427451, 1, 0, 1,
-0.5232282, 0.892944, -1.141526, 0.4235294, 1, 0, 1,
-0.5228239, 0.4124733, 0.9090289, 0.4156863, 1, 0, 1,
-0.5185658, -1.371803, -4.874865, 0.4117647, 1, 0, 1,
-0.518074, -0.4002076, -1.579426, 0.4039216, 1, 0, 1,
-0.5123106, -0.5324191, 0.3033498, 0.3960784, 1, 0, 1,
-0.5073001, -0.7776706, -2.313928, 0.3921569, 1, 0, 1,
-0.5054347, -0.253543, -2.573815, 0.3843137, 1, 0, 1,
-0.5053925, -0.97216, -4.387114, 0.3803922, 1, 0, 1,
-0.5004573, -0.5107551, -2.515935, 0.372549, 1, 0, 1,
-0.4865785, 0.9928624, 0.2156355, 0.3686275, 1, 0, 1,
-0.4838567, 0.2365099, -2.254995, 0.3607843, 1, 0, 1,
-0.4836978, 0.2006347, -0.2047594, 0.3568628, 1, 0, 1,
-0.4828763, 0.1822975, -1.283418, 0.3490196, 1, 0, 1,
-0.4805596, -0.6125014, -1.875186, 0.345098, 1, 0, 1,
-0.478336, -0.6244189, -1.13465, 0.3372549, 1, 0, 1,
-0.4765928, -1.010911, -1.611133, 0.3333333, 1, 0, 1,
-0.4729275, -1.084209, -4.304192, 0.3254902, 1, 0, 1,
-0.4670914, 1.229282, 0.2141624, 0.3215686, 1, 0, 1,
-0.4657005, 0.4234364, -1.257053, 0.3137255, 1, 0, 1,
-0.4635743, -2.032988, -1.654191, 0.3098039, 1, 0, 1,
-0.4621671, 0.7353868, -0.1386377, 0.3019608, 1, 0, 1,
-0.4609125, -0.6530408, -2.46008, 0.2941177, 1, 0, 1,
-0.4581451, 1.142634, -0.8009812, 0.2901961, 1, 0, 1,
-0.4580299, 0.9973198, -0.8037095, 0.282353, 1, 0, 1,
-0.453286, -0.401575, -1.676978, 0.2784314, 1, 0, 1,
-0.4480473, 0.8983253, 0.0368075, 0.2705882, 1, 0, 1,
-0.4471352, -0.611351, -2.272285, 0.2666667, 1, 0, 1,
-0.4463575, -2.542447, -3.097454, 0.2588235, 1, 0, 1,
-0.4420547, 0.7938875, 0.08369423, 0.254902, 1, 0, 1,
-0.4417108, 0.3677305, -1.572902, 0.2470588, 1, 0, 1,
-0.4352903, -0.509532, -2.072063, 0.2431373, 1, 0, 1,
-0.4310279, 0.1720658, -1.112019, 0.2352941, 1, 0, 1,
-0.4253377, 0.6759107, -2.701125, 0.2313726, 1, 0, 1,
-0.4216456, 0.1444854, -1.350397, 0.2235294, 1, 0, 1,
-0.4204198, -0.006301001, -2.004915, 0.2196078, 1, 0, 1,
-0.4160738, -2.182145, -1.71038, 0.2117647, 1, 0, 1,
-0.4153596, 1.262527, 0.3430883, 0.2078431, 1, 0, 1,
-0.4122624, 1.550968, -0.301624, 0.2, 1, 0, 1,
-0.4113993, 0.7159995, -2.552613, 0.1921569, 1, 0, 1,
-0.4090472, -0.8307936, -2.126876, 0.1882353, 1, 0, 1,
-0.4073128, -0.08956188, -1.755691, 0.1803922, 1, 0, 1,
-0.4058898, -0.7171519, -2.106941, 0.1764706, 1, 0, 1,
-0.4048147, -0.707771, -1.248525, 0.1686275, 1, 0, 1,
-0.4045782, 0.5204256, -0.3942309, 0.1647059, 1, 0, 1,
-0.4040159, -0.08739045, -2.055205, 0.1568628, 1, 0, 1,
-0.3986251, 1.922346, 0.6522848, 0.1529412, 1, 0, 1,
-0.3985038, 0.3402478, -1.280653, 0.145098, 1, 0, 1,
-0.3918076, -2.531134, -4.140347, 0.1411765, 1, 0, 1,
-0.3874968, 0.2356058, -1.409251, 0.1333333, 1, 0, 1,
-0.3872068, 1.770385, -1.413082, 0.1294118, 1, 0, 1,
-0.3862945, 0.3037047, 0.05446149, 0.1215686, 1, 0, 1,
-0.3847434, -1.795554, -2.268756, 0.1176471, 1, 0, 1,
-0.3831765, -2.427501, -3.690385, 0.1098039, 1, 0, 1,
-0.3715125, 0.3328347, -1.915225, 0.1058824, 1, 0, 1,
-0.3683314, -0.7109059, -1.146273, 0.09803922, 1, 0, 1,
-0.366409, -0.55865, -1.93554, 0.09019608, 1, 0, 1,
-0.3607448, 1.824791, -0.6038541, 0.08627451, 1, 0, 1,
-0.3602618, -0.3977404, -1.731678, 0.07843138, 1, 0, 1,
-0.35848, -1.381977, -4.39409, 0.07450981, 1, 0, 1,
-0.3567451, -1.355319, -2.746766, 0.06666667, 1, 0, 1,
-0.3537635, 0.6400724, 0.3331588, 0.0627451, 1, 0, 1,
-0.3533582, -2.642347, -3.620929, 0.05490196, 1, 0, 1,
-0.3491801, -0.4763683, -3.298294, 0.05098039, 1, 0, 1,
-0.3380057, 1.147537, -1.038954, 0.04313726, 1, 0, 1,
-0.3341003, 0.1948947, -0.592806, 0.03921569, 1, 0, 1,
-0.3325632, 0.7575083, -0.452666, 0.03137255, 1, 0, 1,
-0.3312828, -0.9333788, -2.696251, 0.02745098, 1, 0, 1,
-0.3299962, 0.2889439, -1.574725, 0.01960784, 1, 0, 1,
-0.3289767, 0.4422681, 0.05199709, 0.01568628, 1, 0, 1,
-0.3261435, 0.5051975, -0.6329978, 0.007843138, 1, 0, 1,
-0.3259482, -1.445867, -3.048847, 0.003921569, 1, 0, 1,
-0.3212838, 0.8964946, -1.911398, 0, 1, 0.003921569, 1,
-0.320726, 0.8021277, -1.053734, 0, 1, 0.01176471, 1,
-0.3177768, 1.814509, -0.3475602, 0, 1, 0.01568628, 1,
-0.3171865, -0.353358, -1.413859, 0, 1, 0.02352941, 1,
-0.3157116, 0.8386288, 0.4668156, 0, 1, 0.02745098, 1,
-0.3138932, -0.5472949, -2.923425, 0, 1, 0.03529412, 1,
-0.3065816, -0.9555131, -3.704405, 0, 1, 0.03921569, 1,
-0.3056226, 0.5807935, -1.715353, 0, 1, 0.04705882, 1,
-0.3047842, -0.9026139, -1.857635, 0, 1, 0.05098039, 1,
-0.3039055, -0.855358, -2.280396, 0, 1, 0.05882353, 1,
-0.3006561, 1.776228, 0.8079907, 0, 1, 0.0627451, 1,
-0.3001361, -0.7274011, -4.001861, 0, 1, 0.07058824, 1,
-0.2989124, 0.5176976, -1.19827, 0, 1, 0.07450981, 1,
-0.2988652, 0.5422845, 1.557392, 0, 1, 0.08235294, 1,
-0.2974849, -0.247178, -3.111447, 0, 1, 0.08627451, 1,
-0.296774, -0.3768181, -0.6486812, 0, 1, 0.09411765, 1,
-0.2951235, -0.7395953, -3.058906, 0, 1, 0.1019608, 1,
-0.2908362, 0.4711192, -0.3765188, 0, 1, 0.1058824, 1,
-0.289313, 0.515195, -0.2108584, 0, 1, 0.1137255, 1,
-0.2886583, -0.1778912, -1.973623, 0, 1, 0.1176471, 1,
-0.2876988, -0.286916, -1.933863, 0, 1, 0.1254902, 1,
-0.2876946, 1.143407, -0.9672523, 0, 1, 0.1294118, 1,
-0.2811837, -1.854915, -2.548747, 0, 1, 0.1372549, 1,
-0.2724698, -0.598079, -2.801532, 0, 1, 0.1411765, 1,
-0.2686037, -1.366063, -2.335378, 0, 1, 0.1490196, 1,
-0.2677519, 0.1054333, -2.097018, 0, 1, 0.1529412, 1,
-0.2650692, 0.4489341, 1.713593, 0, 1, 0.1607843, 1,
-0.2601251, -1.541962, -3.078135, 0, 1, 0.1647059, 1,
-0.2572002, -0.6458398, -3.996675, 0, 1, 0.172549, 1,
-0.2562239, -0.1257286, -3.827406, 0, 1, 0.1764706, 1,
-0.2561215, 0.7720553, -0.769673, 0, 1, 0.1843137, 1,
-0.2543741, -0.1836418, -2.067416, 0, 1, 0.1882353, 1,
-0.2519086, 1.284303, 1.367554, 0, 1, 0.1960784, 1,
-0.2518692, -1.813931, -1.108079, 0, 1, 0.2039216, 1,
-0.2501447, 1.19139, 0.202742, 0, 1, 0.2078431, 1,
-0.2397615, -0.7338083, -4.381094, 0, 1, 0.2156863, 1,
-0.2359795, 0.3523605, -1.172904, 0, 1, 0.2196078, 1,
-0.2288455, -1.215477, -0.2455392, 0, 1, 0.227451, 1,
-0.2271107, 1.395171, -0.5402055, 0, 1, 0.2313726, 1,
-0.2181255, 0.29193, -2.063831, 0, 1, 0.2392157, 1,
-0.2133332, 0.3488559, 1.344123, 0, 1, 0.2431373, 1,
-0.2108074, 0.2225035, 1.426482, 0, 1, 0.2509804, 1,
-0.208689, 0.1501773, -1.326441, 0, 1, 0.254902, 1,
-0.2084974, 0.7296748, -0.563563, 0, 1, 0.2627451, 1,
-0.2082287, 0.3801267, 0.3157291, 0, 1, 0.2666667, 1,
-0.2074687, 0.5594739, -0.547192, 0, 1, 0.2745098, 1,
-0.2019771, -1.398119, -3.838947, 0, 1, 0.2784314, 1,
-0.2012538, 0.9066496, -0.8455808, 0, 1, 0.2862745, 1,
-0.1950842, 0.1005283, -2.42216, 0, 1, 0.2901961, 1,
-0.1933919, -0.07285387, -3.336052, 0, 1, 0.2980392, 1,
-0.1912524, -0.3169049, -2.779113, 0, 1, 0.3058824, 1,
-0.185527, -1.023165, -3.582458, 0, 1, 0.3098039, 1,
-0.185046, -0.5446557, -4.094628, 0, 1, 0.3176471, 1,
-0.1845392, -0.4798929, -3.328309, 0, 1, 0.3215686, 1,
-0.1825046, 1.863287, -0.1944974, 0, 1, 0.3294118, 1,
-0.1804589, 0.9554748, -1.470433, 0, 1, 0.3333333, 1,
-0.1765833, -1.609504, -4.751306, 0, 1, 0.3411765, 1,
-0.1759714, 0.7622452, -1.028733, 0, 1, 0.345098, 1,
-0.1742473, -1.082889, -3.771509, 0, 1, 0.3529412, 1,
-0.1738143, 0.1090657, -3.159405, 0, 1, 0.3568628, 1,
-0.1733439, 1.705685, -1.306631, 0, 1, 0.3647059, 1,
-0.1722483, -0.3849325, -2.438047, 0, 1, 0.3686275, 1,
-0.1706818, 0.2833638, -0.7260896, 0, 1, 0.3764706, 1,
-0.1706512, -0.4426264, -2.475701, 0, 1, 0.3803922, 1,
-0.1687175, 1.470891, -0.6520557, 0, 1, 0.3882353, 1,
-0.1643707, 0.08278866, -1.608237, 0, 1, 0.3921569, 1,
-0.1591309, -2.423614, -3.173541, 0, 1, 0.4, 1,
-0.1539355, -2.270935, -3.6678, 0, 1, 0.4078431, 1,
-0.1535793, -0.7623998, -3.899641, 0, 1, 0.4117647, 1,
-0.1511256, 0.1499532, 1.894195, 0, 1, 0.4196078, 1,
-0.1488269, -0.3015321, -4.271369, 0, 1, 0.4235294, 1,
-0.1476141, 0.1933194, 0.2874947, 0, 1, 0.4313726, 1,
-0.1474814, 0.6898, -1.155252, 0, 1, 0.4352941, 1,
-0.1454704, 1.445167, -0.5750514, 0, 1, 0.4431373, 1,
-0.1389612, 1.326548, -0.5886928, 0, 1, 0.4470588, 1,
-0.1348536, 0.2366925, 0.04014746, 0, 1, 0.454902, 1,
-0.1284701, -0.353945, -1.823932, 0, 1, 0.4588235, 1,
-0.1283757, -1.055619, -2.448911, 0, 1, 0.4666667, 1,
-0.1272189, 0.4152572, -1.224031, 0, 1, 0.4705882, 1,
-0.1270091, 1.475114, -0.4114095, 0, 1, 0.4784314, 1,
-0.1259933, -1.391401, -3.851969, 0, 1, 0.4823529, 1,
-0.1253875, -2.028158, -4.070652, 0, 1, 0.4901961, 1,
-0.1249799, -0.2335974, -3.498322, 0, 1, 0.4941176, 1,
-0.1245948, -1.298742, -3.535922, 0, 1, 0.5019608, 1,
-0.1221696, 0.1507708, 0.315354, 0, 1, 0.509804, 1,
-0.1215078, 1.628382, 0.294031, 0, 1, 0.5137255, 1,
-0.1184303, -0.3771242, -2.379466, 0, 1, 0.5215687, 1,
-0.1181266, 0.4095882, -1.342834, 0, 1, 0.5254902, 1,
-0.1166012, -1.669647, -3.52111, 0, 1, 0.5333334, 1,
-0.116571, 0.3096892, 1.238179, 0, 1, 0.5372549, 1,
-0.1156229, -1.76562, -2.573943, 0, 1, 0.5450981, 1,
-0.1147244, -1.4394, -3.697141, 0, 1, 0.5490196, 1,
-0.1119147, -0.923283, -3.105986, 0, 1, 0.5568628, 1,
-0.1100463, 0.6366528, -1.293309, 0, 1, 0.5607843, 1,
-0.1070698, -0.1025098, -2.337815, 0, 1, 0.5686275, 1,
-0.1044321, -0.6984952, -4.727299, 0, 1, 0.572549, 1,
-0.1027484, -1.780702, -4.060615, 0, 1, 0.5803922, 1,
-0.09924729, -0.3087508, -2.036023, 0, 1, 0.5843138, 1,
-0.09877658, 1.428992, 0.8670698, 0, 1, 0.5921569, 1,
-0.09532915, 0.1857323, -1.30842, 0, 1, 0.5960785, 1,
-0.09526581, 2.104088, -0.2716357, 0, 1, 0.6039216, 1,
-0.09418014, -1.089036, -2.784102, 0, 1, 0.6117647, 1,
-0.08467574, -1.653009, -1.391805, 0, 1, 0.6156863, 1,
-0.07980464, -1.425809, -3.625699, 0, 1, 0.6235294, 1,
-0.07882753, -1.945387, -3.644757, 0, 1, 0.627451, 1,
-0.07827568, -0.3273994, -2.129184, 0, 1, 0.6352941, 1,
-0.07684176, 0.6719849, -0.5592762, 0, 1, 0.6392157, 1,
-0.0756861, 0.5648956, -0.2102087, 0, 1, 0.6470588, 1,
-0.0751621, -0.3018629, -1.370091, 0, 1, 0.6509804, 1,
-0.07376399, -0.3046563, -3.312714, 0, 1, 0.6588235, 1,
-0.07233445, -1.03041, -4.66805, 0, 1, 0.6627451, 1,
-0.07126474, -0.771208, -3.379732, 0, 1, 0.6705883, 1,
-0.06783324, -0.1795841, -3.542, 0, 1, 0.6745098, 1,
-0.0672169, -1.282364, -4.825038, 0, 1, 0.682353, 1,
-0.06482651, 2.357564, 0.5331842, 0, 1, 0.6862745, 1,
-0.06133406, -0.4001664, -2.699399, 0, 1, 0.6941177, 1,
-0.06020049, 0.1007304, -1.557446, 0, 1, 0.7019608, 1,
-0.05776217, 0.3561118, 0.8342614, 0, 1, 0.7058824, 1,
-0.05652817, -0.612623, -2.862324, 0, 1, 0.7137255, 1,
-0.05561574, -1.754298, -4.558893, 0, 1, 0.7176471, 1,
-0.0541792, 0.1490362, 1.334306, 0, 1, 0.7254902, 1,
-0.05123309, -0.254683, -2.701379, 0, 1, 0.7294118, 1,
-0.05019147, -0.848992, -3.853095, 0, 1, 0.7372549, 1,
-0.04698749, 2.25868, -1.244733, 0, 1, 0.7411765, 1,
-0.04233253, 1.715879, -0.2630076, 0, 1, 0.7490196, 1,
-0.03863944, -0.4338843, -2.600994, 0, 1, 0.7529412, 1,
-0.03598432, -1.031169, -2.555818, 0, 1, 0.7607843, 1,
-0.03488185, 0.2553453, 0.2130626, 0, 1, 0.7647059, 1,
-0.03145334, -0.3653439, -2.73166, 0, 1, 0.772549, 1,
-0.03138243, 1.946084, -0.2668661, 0, 1, 0.7764706, 1,
-0.02980459, -0.6696312, -1.820517, 0, 1, 0.7843137, 1,
-0.02770591, -0.471317, -2.700702, 0, 1, 0.7882353, 1,
-0.02310548, 1.069927, 0.3214115, 0, 1, 0.7960784, 1,
-0.01810927, -0.7218525, -4.484846, 0, 1, 0.8039216, 1,
-0.0177901, -0.5031022, -1.977987, 0, 1, 0.8078431, 1,
-0.01542637, -1.361178, -3.617639, 0, 1, 0.8156863, 1,
-0.01184667, -0.06385862, -3.298331, 0, 1, 0.8196079, 1,
-0.01117147, -0.7150539, -3.367195, 0, 1, 0.827451, 1,
-0.0008126993, 0.1799891, 0.6581725, 0, 1, 0.8313726, 1,
0.0004897153, -0.3187613, 3.35481, 0, 1, 0.8392157, 1,
0.003326485, 1.648972, 1.709013, 0, 1, 0.8431373, 1,
0.004800332, 0.8436577, 1.706084, 0, 1, 0.8509804, 1,
0.01193562, 0.1928687, 0.6258694, 0, 1, 0.854902, 1,
0.01449812, 1.015467, 0.4618856, 0, 1, 0.8627451, 1,
0.01463548, -0.4796077, 2.692219, 0, 1, 0.8666667, 1,
0.01946628, -1.008625, 2.170951, 0, 1, 0.8745098, 1,
0.01981127, -0.9397766, 3.658556, 0, 1, 0.8784314, 1,
0.01995106, 1.478091, 0.7392763, 0, 1, 0.8862745, 1,
0.02183428, 1.271744, 0.5491301, 0, 1, 0.8901961, 1,
0.02565731, 0.5380058, 0.3693146, 0, 1, 0.8980392, 1,
0.03466338, 1.001076, -0.573777, 0, 1, 0.9058824, 1,
0.0390592, 1.151754, -0.8537756, 0, 1, 0.9098039, 1,
0.03924392, 0.6135904, -1.285272, 0, 1, 0.9176471, 1,
0.03942082, 0.646889, -0.163992, 0, 1, 0.9215686, 1,
0.03989557, 0.08524131, 2.416677, 0, 1, 0.9294118, 1,
0.04231261, 1.747056, -0.3892742, 0, 1, 0.9333333, 1,
0.04245004, -0.1616575, 3.991175, 0, 1, 0.9411765, 1,
0.04383223, 0.06479226, 0.9064242, 0, 1, 0.945098, 1,
0.04725589, 0.447206, -0.5928297, 0, 1, 0.9529412, 1,
0.04875477, 1.217003, 1.732002, 0, 1, 0.9568627, 1,
0.05235276, -0.0005933608, 2.659541, 0, 1, 0.9647059, 1,
0.05468422, 0.3612072, -0.09922063, 0, 1, 0.9686275, 1,
0.05725027, -0.3418441, 4.264013, 0, 1, 0.9764706, 1,
0.05844103, 1.292759, 1.138017, 0, 1, 0.9803922, 1,
0.06527149, -0.07889562, 4.324182, 0, 1, 0.9882353, 1,
0.0670756, -0.6294293, 2.246993, 0, 1, 0.9921569, 1,
0.06927931, 0.08332708, 1.320131, 0, 1, 1, 1,
0.07412098, -0.4938895, 3.29637, 0, 0.9921569, 1, 1,
0.07595082, 2.132396, 0.2335087, 0, 0.9882353, 1, 1,
0.07716287, -1.260705, 2.66967, 0, 0.9803922, 1, 1,
0.07734089, 0.7520322, 0.7839785, 0, 0.9764706, 1, 1,
0.08177143, -1.456005, 4.851418, 0, 0.9686275, 1, 1,
0.0823641, -1.422361, 2.328876, 0, 0.9647059, 1, 1,
0.08534976, -1.078816, 3.784964, 0, 0.9568627, 1, 1,
0.0865014, 1.152944, 0.9007385, 0, 0.9529412, 1, 1,
0.09156352, -0.2654482, 2.830088, 0, 0.945098, 1, 1,
0.09337749, 1.687149, -0.203146, 0, 0.9411765, 1, 1,
0.09440611, -1.258633, 5.528917, 0, 0.9333333, 1, 1,
0.09678509, -0.3612542, 5.297794, 0, 0.9294118, 1, 1,
0.09749596, -0.286856, 1.586638, 0, 0.9215686, 1, 1,
0.09810171, 1.050075, -2.140468, 0, 0.9176471, 1, 1,
0.09960461, 0.1595211, 1.005616, 0, 0.9098039, 1, 1,
0.1016866, -0.1465234, 3.063722, 0, 0.9058824, 1, 1,
0.1035019, 0.1255144, 0.6089714, 0, 0.8980392, 1, 1,
0.1060244, -0.463569, 4.263989, 0, 0.8901961, 1, 1,
0.1066231, -0.2036822, 2.87237, 0, 0.8862745, 1, 1,
0.1126865, -0.7180126, 2.841209, 0, 0.8784314, 1, 1,
0.1128813, 0.750225, -1.447056, 0, 0.8745098, 1, 1,
0.1184716, -0.5612956, 2.400662, 0, 0.8666667, 1, 1,
0.1190671, 0.2308937, -0.7154889, 0, 0.8627451, 1, 1,
0.1197897, 1.137229, 1.706962, 0, 0.854902, 1, 1,
0.1199993, 0.415183, 0.4327337, 0, 0.8509804, 1, 1,
0.1241582, 0.69155, 0.7470823, 0, 0.8431373, 1, 1,
0.124378, 0.6814405, 1.339896, 0, 0.8392157, 1, 1,
0.1257192, -0.08219635, 2.721424, 0, 0.8313726, 1, 1,
0.1399109, 0.4009739, 0.9621333, 0, 0.827451, 1, 1,
0.1434653, -0.0685667, 1.825507, 0, 0.8196079, 1, 1,
0.1449219, -1.196867, 2.336395, 0, 0.8156863, 1, 1,
0.1493971, 0.6260244, 0.5063264, 0, 0.8078431, 1, 1,
0.1529342, 0.352259, 1.227001, 0, 0.8039216, 1, 1,
0.156246, 0.2199229, 0.5250481, 0, 0.7960784, 1, 1,
0.1564281, 0.6181134, -0.2522468, 0, 0.7882353, 1, 1,
0.1579784, 0.4029107, -0.8775783, 0, 0.7843137, 1, 1,
0.1594963, 0.2006375, 1.701085, 0, 0.7764706, 1, 1,
0.1598744, 1.479551, -0.01801851, 0, 0.772549, 1, 1,
0.1620225, 1.773318, 0.2027977, 0, 0.7647059, 1, 1,
0.1624185, 0.1847073, 0.379972, 0, 0.7607843, 1, 1,
0.1631408, 1.339399, -0.8919775, 0, 0.7529412, 1, 1,
0.1666501, 1.212213, -0.03420964, 0, 0.7490196, 1, 1,
0.1686606, 0.3581471, 1.873107, 0, 0.7411765, 1, 1,
0.1786281, 0.7039627, 0.5166822, 0, 0.7372549, 1, 1,
0.1801596, 1.846459, 0.7511663, 0, 0.7294118, 1, 1,
0.180343, 1.182396, -1.433417, 0, 0.7254902, 1, 1,
0.1850335, -0.04400127, 2.408832, 0, 0.7176471, 1, 1,
0.1888319, 1.751603, 0.5256762, 0, 0.7137255, 1, 1,
0.1904471, -0.515689, 2.726365, 0, 0.7058824, 1, 1,
0.1910467, -0.110129, 1.88598, 0, 0.6980392, 1, 1,
0.1944242, -0.5656405, 1.518475, 0, 0.6941177, 1, 1,
0.1964067, -0.168001, 1.231958, 0, 0.6862745, 1, 1,
0.1969123, -0.08579896, 2.342335, 0, 0.682353, 1, 1,
0.1976065, -2.446745, 3.551031, 0, 0.6745098, 1, 1,
0.1976518, -1.314337, 2.951636, 0, 0.6705883, 1, 1,
0.1998054, -0.2620082, 3.706059, 0, 0.6627451, 1, 1,
0.1999972, -0.5443321, 1.457184, 0, 0.6588235, 1, 1,
0.2007534, -0.9061355, 2.33972, 0, 0.6509804, 1, 1,
0.2111915, 0.6698539, 0.1456337, 0, 0.6470588, 1, 1,
0.2137687, 0.716116, 0.4413615, 0, 0.6392157, 1, 1,
0.2147452, -1.457129, 2.925179, 0, 0.6352941, 1, 1,
0.2152549, 0.1183088, 0.8129939, 0, 0.627451, 1, 1,
0.2156977, -1.821252, 2.669292, 0, 0.6235294, 1, 1,
0.2175368, 1.574974, 0.6866144, 0, 0.6156863, 1, 1,
0.2189004, -0.772808, 3.488761, 0, 0.6117647, 1, 1,
0.2209753, -0.3570138, 3.486609, 0, 0.6039216, 1, 1,
0.2227173, 1.564553, -0.1360878, 0, 0.5960785, 1, 1,
0.2313639, -0.4039483, 2.640085, 0, 0.5921569, 1, 1,
0.2316994, -1.275938, 3.379168, 0, 0.5843138, 1, 1,
0.2329915, -0.3532028, 2.054571, 0, 0.5803922, 1, 1,
0.2351896, -0.5716739, 4.275602, 0, 0.572549, 1, 1,
0.2371706, 1.643139, 0.2738058, 0, 0.5686275, 1, 1,
0.2379156, 0.3658157, -0.7285974, 0, 0.5607843, 1, 1,
0.2392855, -0.7209421, 4.917284, 0, 0.5568628, 1, 1,
0.2406534, -0.9810104, 1.585109, 0, 0.5490196, 1, 1,
0.2424719, 0.2662907, 1.474696, 0, 0.5450981, 1, 1,
0.2464022, 2.016605, 0.2268961, 0, 0.5372549, 1, 1,
0.2464122, -1.255875, 2.663985, 0, 0.5333334, 1, 1,
0.2475956, -0.7123216, 3.741575, 0, 0.5254902, 1, 1,
0.2486281, 0.5733877, 1.642854, 0, 0.5215687, 1, 1,
0.253381, 0.42709, -0.7988388, 0, 0.5137255, 1, 1,
0.2556246, -0.03431681, 0.268374, 0, 0.509804, 1, 1,
0.257185, -0.2162112, 2.741685, 0, 0.5019608, 1, 1,
0.2609105, -0.04197636, 0.04663954, 0, 0.4941176, 1, 1,
0.2649871, -0.370804, 1.975165, 0, 0.4901961, 1, 1,
0.270897, -0.4052156, 2.990262, 0, 0.4823529, 1, 1,
0.2715324, 0.7079902, -0.4665025, 0, 0.4784314, 1, 1,
0.272513, -0.4352546, 2.419243, 0, 0.4705882, 1, 1,
0.2743083, 0.765106, 0.7012562, 0, 0.4666667, 1, 1,
0.2794797, 1.114094, -0.1221005, 0, 0.4588235, 1, 1,
0.2806379, 1.619074, 0.7572309, 0, 0.454902, 1, 1,
0.2825706, 0.7773995, 0.08864759, 0, 0.4470588, 1, 1,
0.2841848, -2.218781, 3.666373, 0, 0.4431373, 1, 1,
0.2846379, 2.443977, 0.2461612, 0, 0.4352941, 1, 1,
0.2866777, 0.09858482, -0.2954167, 0, 0.4313726, 1, 1,
0.286909, -1.154648, 2.975718, 0, 0.4235294, 1, 1,
0.2912626, -0.710305, 1.12013, 0, 0.4196078, 1, 1,
0.2941337, 0.5778051, 0.5893035, 0, 0.4117647, 1, 1,
0.2953244, 0.3447369, 0.1518937, 0, 0.4078431, 1, 1,
0.2956272, 1.381052, 0.9499111, 0, 0.4, 1, 1,
0.2967022, -1.559565, 2.167967, 0, 0.3921569, 1, 1,
0.3007734, 0.4289991, -0.2155152, 0, 0.3882353, 1, 1,
0.3024684, -0.7541828, 1.606105, 0, 0.3803922, 1, 1,
0.3036875, 0.6601316, 1.320936, 0, 0.3764706, 1, 1,
0.3043987, -1.23734, 2.871066, 0, 0.3686275, 1, 1,
0.3070868, -0.7892048, 3.716673, 0, 0.3647059, 1, 1,
0.3114011, -0.2621363, 2.08038, 0, 0.3568628, 1, 1,
0.3145916, 0.7254845, 0.6066296, 0, 0.3529412, 1, 1,
0.3148514, -1.672154, 2.624481, 0, 0.345098, 1, 1,
0.315826, -0.3909126, 2.944659, 0, 0.3411765, 1, 1,
0.3163048, -0.3154184, 1.641408, 0, 0.3333333, 1, 1,
0.3170505, -0.7727591, 2.469583, 0, 0.3294118, 1, 1,
0.3192213, -0.1740161, 0.4348851, 0, 0.3215686, 1, 1,
0.3219082, -0.5557455, 2.69787, 0, 0.3176471, 1, 1,
0.3235748, 0.1938092, 1.250497, 0, 0.3098039, 1, 1,
0.3259881, 1.474007, -0.1648905, 0, 0.3058824, 1, 1,
0.326432, -0.3429229, 3.81318, 0, 0.2980392, 1, 1,
0.3303079, -1.177758, 3.136037, 0, 0.2901961, 1, 1,
0.3325293, -1.398522, 2.083799, 0, 0.2862745, 1, 1,
0.33898, 0.7025235, 0.6118756, 0, 0.2784314, 1, 1,
0.3405039, 0.2847399, 1.56745, 0, 0.2745098, 1, 1,
0.3426772, 0.1876949, 1.742081, 0, 0.2666667, 1, 1,
0.3441142, -0.8643206, 2.964243, 0, 0.2627451, 1, 1,
0.3460007, 0.4085509, 0.1511635, 0, 0.254902, 1, 1,
0.3505695, -0.9029854, 1.365644, 0, 0.2509804, 1, 1,
0.3509193, 2.292174, 2.460695, 0, 0.2431373, 1, 1,
0.3519715, -1.871876, 3.994009, 0, 0.2392157, 1, 1,
0.3521648, -0.8527278, 4.720428, 0, 0.2313726, 1, 1,
0.3564085, 0.8779039, -0.1945289, 0, 0.227451, 1, 1,
0.3577378, 1.473441, 0.2002091, 0, 0.2196078, 1, 1,
0.3577417, -0.2474597, 2.275405, 0, 0.2156863, 1, 1,
0.3586659, 0.7400911, -0.2554944, 0, 0.2078431, 1, 1,
0.3670519, 2.248789, 2.254727, 0, 0.2039216, 1, 1,
0.3683907, 0.1741952, 0.2357237, 0, 0.1960784, 1, 1,
0.3695204, 0.7861291, -0.4227335, 0, 0.1882353, 1, 1,
0.3717444, -1.022093, 2.288381, 0, 0.1843137, 1, 1,
0.371977, -0.8345106, 3.340826, 0, 0.1764706, 1, 1,
0.3721243, 0.06055843, 2.196391, 0, 0.172549, 1, 1,
0.3767715, -0.3097951, 1.921791, 0, 0.1647059, 1, 1,
0.3774007, -0.1866145, 1.581147, 0, 0.1607843, 1, 1,
0.3776079, 0.8367808, 0.2699372, 0, 0.1529412, 1, 1,
0.3786291, -2.809035, 2.475638, 0, 0.1490196, 1, 1,
0.379065, 1.229884, 1.359461, 0, 0.1411765, 1, 1,
0.3794648, 0.4022536, 0.2123255, 0, 0.1372549, 1, 1,
0.3802876, -1.041152, 2.235617, 0, 0.1294118, 1, 1,
0.3883769, -0.4016339, 3.572172, 0, 0.1254902, 1, 1,
0.3904933, 0.2966329, 1.490886, 0, 0.1176471, 1, 1,
0.390518, 0.1117778, 1.21976, 0, 0.1137255, 1, 1,
0.3913495, 0.06530021, 2.043628, 0, 0.1058824, 1, 1,
0.3925883, -0.5876225, 2.728427, 0, 0.09803922, 1, 1,
0.3943636, 0.701165, -0.1772971, 0, 0.09411765, 1, 1,
0.3946176, 0.9882559, 2.15788, 0, 0.08627451, 1, 1,
0.3959372, -1.060335, 1.416795, 0, 0.08235294, 1, 1,
0.4025045, -0.1615984, 2.46972, 0, 0.07450981, 1, 1,
0.4091048, 1.742567, 0.01622144, 0, 0.07058824, 1, 1,
0.4096934, -2.240303, 2.622599, 0, 0.0627451, 1, 1,
0.4111944, 0.03071549, 0.4319375, 0, 0.05882353, 1, 1,
0.4122003, 1.182753, 1.017945, 0, 0.05098039, 1, 1,
0.4135649, 0.2785302, 2.756716, 0, 0.04705882, 1, 1,
0.417226, 0.3556808, 0.8237141, 0, 0.03921569, 1, 1,
0.418299, -0.05440802, 3.778695, 0, 0.03529412, 1, 1,
0.4191499, 0.4638838, 0.218031, 0, 0.02745098, 1, 1,
0.4214208, 1.716536, -1.49055, 0, 0.02352941, 1, 1,
0.4222332, 0.1606089, 1.424795, 0, 0.01568628, 1, 1,
0.4224966, 0.2381802, 0.0558878, 0, 0.01176471, 1, 1,
0.425798, -0.1689898, 1.379275, 0, 0.003921569, 1, 1,
0.4275699, -0.2791536, 1.451961, 0.003921569, 0, 1, 1,
0.4305247, -1.316881, 3.229377, 0.007843138, 0, 1, 1,
0.431832, 1.498043, 0.3399444, 0.01568628, 0, 1, 1,
0.4351163, 0.6936352, -0.8120214, 0.01960784, 0, 1, 1,
0.4362141, -0.2781485, 2.459167, 0.02745098, 0, 1, 1,
0.4400399, 0.3088328, -0.4623064, 0.03137255, 0, 1, 1,
0.4402574, -0.05744998, 1.699397, 0.03921569, 0, 1, 1,
0.4410852, 0.1074867, -0.4126315, 0.04313726, 0, 1, 1,
0.4421235, 0.8282435, 0.8407251, 0.05098039, 0, 1, 1,
0.444595, -1.905732, 1.175774, 0.05490196, 0, 1, 1,
0.4463589, -0.6765825, 3.204232, 0.0627451, 0, 1, 1,
0.4466844, 1.093017, 0.5399753, 0.06666667, 0, 1, 1,
0.4494824, -0.5752871, 2.203515, 0.07450981, 0, 1, 1,
0.4533657, 0.1109721, 1.04344, 0.07843138, 0, 1, 1,
0.4545352, -0.4361875, 2.089846, 0.08627451, 0, 1, 1,
0.459956, 0.9882363, -1.233846, 0.09019608, 0, 1, 1,
0.462859, 0.4377644, 0.05039627, 0.09803922, 0, 1, 1,
0.4641211, -0.7996769, 3.3265, 0.1058824, 0, 1, 1,
0.4660568, 1.202863, 0.6255325, 0.1098039, 0, 1, 1,
0.4686749, -1.162881, 3.640933, 0.1176471, 0, 1, 1,
0.4769289, 1.833524, 0.4203739, 0.1215686, 0, 1, 1,
0.4774438, 0.7989653, -2.416461, 0.1294118, 0, 1, 1,
0.4794645, -0.53842, 2.673244, 0.1333333, 0, 1, 1,
0.4800904, 0.8274269, 0.0650417, 0.1411765, 0, 1, 1,
0.4810922, -1.29092, 2.818629, 0.145098, 0, 1, 1,
0.4852036, -2.036396, 3.761492, 0.1529412, 0, 1, 1,
0.4869285, -0.3244323, 2.278529, 0.1568628, 0, 1, 1,
0.4875256, -1.372414, 2.045005, 0.1647059, 0, 1, 1,
0.4883301, -0.7891356, 3.167, 0.1686275, 0, 1, 1,
0.4964234, -0.2650582, 2.232234, 0.1764706, 0, 1, 1,
0.5024245, 0.1275776, 2.343378, 0.1803922, 0, 1, 1,
0.5024655, 0.7252936, 0.3733757, 0.1882353, 0, 1, 1,
0.5087048, 1.138841, 1.812431, 0.1921569, 0, 1, 1,
0.5089669, 2.293541, -0.2473533, 0.2, 0, 1, 1,
0.5092846, 0.6061596, 0.1499677, 0.2078431, 0, 1, 1,
0.5138859, -1.687227, 3.877931, 0.2117647, 0, 1, 1,
0.5178826, 0.1035616, 1.079395, 0.2196078, 0, 1, 1,
0.5195197, 0.4619075, 0.7712469, 0.2235294, 0, 1, 1,
0.5271352, 0.3695825, 1.099548, 0.2313726, 0, 1, 1,
0.5295961, -0.1942483, 3.147488, 0.2352941, 0, 1, 1,
0.5318658, 0.415304, 1.924076, 0.2431373, 0, 1, 1,
0.5326257, -0.7613626, 2.115722, 0.2470588, 0, 1, 1,
0.5336739, 1.034133, 0.5922039, 0.254902, 0, 1, 1,
0.5353853, -0.7905712, 2.372456, 0.2588235, 0, 1, 1,
0.5369841, 1.294086, 0.7580112, 0.2666667, 0, 1, 1,
0.53707, -0.2137622, 2.485161, 0.2705882, 0, 1, 1,
0.5407459, -0.6012377, 3.400358, 0.2784314, 0, 1, 1,
0.5421687, 2.411157, 0.754303, 0.282353, 0, 1, 1,
0.542436, 1.327713, -1.118879, 0.2901961, 0, 1, 1,
0.5442785, 0.2878766, 0.8859197, 0.2941177, 0, 1, 1,
0.5451195, -0.3987893, 1.919509, 0.3019608, 0, 1, 1,
0.5477711, -0.4755586, 2.696018, 0.3098039, 0, 1, 1,
0.5492314, 1.031669, -0.08337258, 0.3137255, 0, 1, 1,
0.5583445, 0.5107756, 0.07299159, 0.3215686, 0, 1, 1,
0.5588247, 0.4715412, 1.375471, 0.3254902, 0, 1, 1,
0.559822, -0.3007228, 2.690692, 0.3333333, 0, 1, 1,
0.5605925, 0.4530187, 0.01758796, 0.3372549, 0, 1, 1,
0.5613394, 0.7655395, 0.5734599, 0.345098, 0, 1, 1,
0.5625798, -2.200837, 3.173153, 0.3490196, 0, 1, 1,
0.5674406, 0.4515646, -3.424438, 0.3568628, 0, 1, 1,
0.5706721, 0.502151, 0.4022959, 0.3607843, 0, 1, 1,
0.5728899, -0.4903112, 1.903747, 0.3686275, 0, 1, 1,
0.5749804, 1.622835, 0.5516422, 0.372549, 0, 1, 1,
0.5765468, 1.872352, -0.1111798, 0.3803922, 0, 1, 1,
0.5772235, -1.413658, 3.365961, 0.3843137, 0, 1, 1,
0.5776371, -1.556347, 3.183625, 0.3921569, 0, 1, 1,
0.5788668, 0.7220857, 3.867706, 0.3960784, 0, 1, 1,
0.5804913, 1.202673, 1.517622, 0.4039216, 0, 1, 1,
0.5898816, -1.501535, 3.180857, 0.4117647, 0, 1, 1,
0.5918483, -0.03831997, 0.4986637, 0.4156863, 0, 1, 1,
0.5947152, -0.024691, 1.228539, 0.4235294, 0, 1, 1,
0.598435, -0.7397646, 1.422536, 0.427451, 0, 1, 1,
0.599715, 1.021421, 0.3463115, 0.4352941, 0, 1, 1,
0.6069231, 0.4633615, 0.6382171, 0.4392157, 0, 1, 1,
0.6099234, 0.4957559, 1.888904, 0.4470588, 0, 1, 1,
0.6150589, -0.4632069, 2.270235, 0.4509804, 0, 1, 1,
0.6198585, -0.4608999, 3.438716, 0.4588235, 0, 1, 1,
0.6219683, -0.6527402, 3.027567, 0.4627451, 0, 1, 1,
0.6229704, -0.8570717, 2.581506, 0.4705882, 0, 1, 1,
0.6272555, 0.2369152, 0.626231, 0.4745098, 0, 1, 1,
0.6296008, -0.5125016, 2.476815, 0.4823529, 0, 1, 1,
0.6299925, 0.0003549475, 2.680693, 0.4862745, 0, 1, 1,
0.6314889, 0.4188401, -0.03761657, 0.4941176, 0, 1, 1,
0.642853, 0.6861992, 0.199918, 0.5019608, 0, 1, 1,
0.6536392, 0.7041701, -1.233155, 0.5058824, 0, 1, 1,
0.6566589, 0.1747576, 1.044492, 0.5137255, 0, 1, 1,
0.6631657, -0.3568299, 1.739755, 0.5176471, 0, 1, 1,
0.6637726, 1.120905, -0.733135, 0.5254902, 0, 1, 1,
0.6653859, 1.08325, 0.4180464, 0.5294118, 0, 1, 1,
0.6686416, 0.6547052, -0.5961241, 0.5372549, 0, 1, 1,
0.6723467, 0.4152269, 0.9973373, 0.5411765, 0, 1, 1,
0.672608, -0.005196581, 1.950028, 0.5490196, 0, 1, 1,
0.6801598, 0.3409465, 1.148462, 0.5529412, 0, 1, 1,
0.6966703, 0.3658789, 1.76943, 0.5607843, 0, 1, 1,
0.7065634, 1.753849, -0.2689946, 0.5647059, 0, 1, 1,
0.7086487, -1.749279, 1.445137, 0.572549, 0, 1, 1,
0.7097251, 0.324976, 1.050628, 0.5764706, 0, 1, 1,
0.7128643, -0.1530344, 2.445165, 0.5843138, 0, 1, 1,
0.7133545, 0.2208307, 2.14347, 0.5882353, 0, 1, 1,
0.7190737, -1.513559, 0.9597785, 0.5960785, 0, 1, 1,
0.7212684, -1.513376, 1.160235, 0.6039216, 0, 1, 1,
0.7229868, -2.00145, 3.722484, 0.6078432, 0, 1, 1,
0.7237249, -1.777794, 3.692807, 0.6156863, 0, 1, 1,
0.7243729, 0.8861918, -0.1221335, 0.6196079, 0, 1, 1,
0.7272354, -1.634509, 2.620229, 0.627451, 0, 1, 1,
0.7356913, -1.710003, 1.633014, 0.6313726, 0, 1, 1,
0.7408759, -0.1417294, 1.005836, 0.6392157, 0, 1, 1,
0.7449486, -0.8713095, 1.727244, 0.6431373, 0, 1, 1,
0.7498826, -0.2339511, 2.750459, 0.6509804, 0, 1, 1,
0.7512178, 1.603837, 1.115763, 0.654902, 0, 1, 1,
0.7512363, 0.04443688, 1.102117, 0.6627451, 0, 1, 1,
0.7522903, 0.789125, -0.2298628, 0.6666667, 0, 1, 1,
0.7628062, 0.2337074, 0.9846514, 0.6745098, 0, 1, 1,
0.7652976, 1.119298, 0.1872458, 0.6784314, 0, 1, 1,
0.7696137, 0.3060293, 1.934213, 0.6862745, 0, 1, 1,
0.7703514, -0.6098892, 1.159582, 0.6901961, 0, 1, 1,
0.7723411, 0.4897382, 2.255497, 0.6980392, 0, 1, 1,
0.7811755, 0.2697357, -0.6648859, 0.7058824, 0, 1, 1,
0.7846435, 1.152714, 1.435678, 0.7098039, 0, 1, 1,
0.7861195, -0.6254633, 1.130064, 0.7176471, 0, 1, 1,
0.789214, -1.648603, 2.843241, 0.7215686, 0, 1, 1,
0.7915908, -0.5703801, 2.255727, 0.7294118, 0, 1, 1,
0.795573, -0.4316538, 0.9458863, 0.7333333, 0, 1, 1,
0.7993303, 0.1343784, 0.5135207, 0.7411765, 0, 1, 1,
0.8020733, -0.1032596, 0.2047634, 0.7450981, 0, 1, 1,
0.8052936, 0.5388775, 0.4444095, 0.7529412, 0, 1, 1,
0.8086477, -0.08049348, 1.239624, 0.7568628, 0, 1, 1,
0.8125058, -0.1152872, 1.107693, 0.7647059, 0, 1, 1,
0.8146572, -0.2662812, 1.022975, 0.7686275, 0, 1, 1,
0.8163446, -1.521223, 1.555249, 0.7764706, 0, 1, 1,
0.8169191, 0.06312726, 1.102742, 0.7803922, 0, 1, 1,
0.8185271, 0.3075527, 0.2586096, 0.7882353, 0, 1, 1,
0.8259164, -0.3093029, 3.713349, 0.7921569, 0, 1, 1,
0.8260152, -0.04094806, 2.498793, 0.8, 0, 1, 1,
0.8297501, 1.333305, 1.513321, 0.8078431, 0, 1, 1,
0.8302751, 0.5281094, 1.371383, 0.8117647, 0, 1, 1,
0.8312412, -1.821298, 2.639647, 0.8196079, 0, 1, 1,
0.8321341, -0.9530017, 1.969025, 0.8235294, 0, 1, 1,
0.8329837, -1.250305, 2.421192, 0.8313726, 0, 1, 1,
0.8330345, -0.4690088, -0.2410159, 0.8352941, 0, 1, 1,
0.8345069, -0.9441062, 1.46927, 0.8431373, 0, 1, 1,
0.8410254, 1.638005, 1.34896, 0.8470588, 0, 1, 1,
0.8437037, -0.09694215, 1.650466, 0.854902, 0, 1, 1,
0.844507, 0.7858369, -0.1391478, 0.8588235, 0, 1, 1,
0.851386, -0.8262119, 3.938046, 0.8666667, 0, 1, 1,
0.8513963, 1.264071, -0.2428629, 0.8705882, 0, 1, 1,
0.8528388, -2.188869, 1.614874, 0.8784314, 0, 1, 1,
0.8541805, 1.715915, -1.025801, 0.8823529, 0, 1, 1,
0.860183, 0.1778696, 0.6539165, 0.8901961, 0, 1, 1,
0.8617858, -1.56733, 1.551562, 0.8941177, 0, 1, 1,
0.863838, 0.1128841, 1.166698, 0.9019608, 0, 1, 1,
0.8650956, 0.6841931, 0.1887331, 0.9098039, 0, 1, 1,
0.8671992, 1.311785, 1.431363, 0.9137255, 0, 1, 1,
0.8749266, -1.479257, 1.967963, 0.9215686, 0, 1, 1,
0.875049, -0.6921693, 2.940344, 0.9254902, 0, 1, 1,
0.8752253, 2.186036, -1.554536, 0.9333333, 0, 1, 1,
0.8788188, 1.781531, 0.1028572, 0.9372549, 0, 1, 1,
0.8805873, 0.1262223, 0.1249935, 0.945098, 0, 1, 1,
0.8812703, -0.157327, 1.992932, 0.9490196, 0, 1, 1,
0.8877602, 1.022939, 0.2806811, 0.9568627, 0, 1, 1,
0.8906432, -1.122446, 1.567961, 0.9607843, 0, 1, 1,
0.9004144, 1.210345, 0.7582536, 0.9686275, 0, 1, 1,
0.9057912, 1.320771, 1.760368, 0.972549, 0, 1, 1,
0.9085302, 0.3400586, 1.96231, 0.9803922, 0, 1, 1,
0.9085543, 1.096188, 1.103785, 0.9843137, 0, 1, 1,
0.9101326, -0.6002561, 4.754292, 0.9921569, 0, 1, 1,
0.911545, -1.210888, 3.747598, 0.9960784, 0, 1, 1,
0.916326, 0.3478923, 0.2562297, 1, 0, 0.9960784, 1,
0.9166699, 0.05413043, 0.8312315, 1, 0, 0.9882353, 1,
0.917376, -2.106273, 2.836164, 1, 0, 0.9843137, 1,
0.9212422, 1.991046, 1.710114, 1, 0, 0.9764706, 1,
0.9243959, 0.850843, 0.5310782, 1, 0, 0.972549, 1,
0.9306615, 1.517549, 1.892799, 1, 0, 0.9647059, 1,
0.9313448, 1.10885, 0.8707867, 1, 0, 0.9607843, 1,
0.9320282, -0.2999502, 1.191095, 1, 0, 0.9529412, 1,
0.9356552, 1.060326, 0.3255539, 1, 0, 0.9490196, 1,
0.9372162, 1.593116, 0.3662776, 1, 0, 0.9411765, 1,
0.9448592, 0.8367304, 0.3479519, 1, 0, 0.9372549, 1,
0.9452078, 0.06596442, 2.253011, 1, 0, 0.9294118, 1,
0.9489547, 1.080069, 1.868208, 1, 0, 0.9254902, 1,
0.9518231, 0.002001681, 1.715626, 1, 0, 0.9176471, 1,
0.9632142, 0.3758011, 1.378999, 1, 0, 0.9137255, 1,
0.9700996, 0.895829, 0.7833068, 1, 0, 0.9058824, 1,
0.9706894, -1.484092, 4.239657, 1, 0, 0.9019608, 1,
0.9721045, 0.4856397, 1.827659, 1, 0, 0.8941177, 1,
0.9751245, 0.4728742, 1.241933, 1, 0, 0.8862745, 1,
0.976712, -0.9541521, 3.511395, 1, 0, 0.8823529, 1,
0.9835672, -0.5643589, 2.694976, 1, 0, 0.8745098, 1,
0.9879556, -0.09308726, 1.577436, 1, 0, 0.8705882, 1,
0.9909542, 0.2130582, 0.59541, 1, 0, 0.8627451, 1,
0.9985345, -0.834544, 4.252632, 1, 0, 0.8588235, 1,
0.999272, -0.004074295, 1.298755, 1, 0, 0.8509804, 1,
0.999926, -0.4240848, 1.629431, 1, 0, 0.8470588, 1,
1.000839, -0.9285765, 0.9784492, 1, 0, 0.8392157, 1,
1.002064, -0.7548304, 2.059792, 1, 0, 0.8352941, 1,
1.015016, 2.648785, -0.5248642, 1, 0, 0.827451, 1,
1.015733, -0.9386507, 2.373591, 1, 0, 0.8235294, 1,
1.024306, -0.1594585, 1.662627, 1, 0, 0.8156863, 1,
1.028222, 1.965503, 2.212554, 1, 0, 0.8117647, 1,
1.030025, 1.153984, 0.6818455, 1, 0, 0.8039216, 1,
1.030229, 1.36954, 1.541362, 1, 0, 0.7960784, 1,
1.032634, -1.35609, 2.552608, 1, 0, 0.7921569, 1,
1.032967, -0.6573523, 1.713322, 1, 0, 0.7843137, 1,
1.032998, 0.3748288, 0.4506557, 1, 0, 0.7803922, 1,
1.042173, 0.6140487, 0.2585727, 1, 0, 0.772549, 1,
1.043637, 0.1052751, 0.6746043, 1, 0, 0.7686275, 1,
1.044689, 0.4063945, 1.527266, 1, 0, 0.7607843, 1,
1.053575, -2.647504, 1.4992, 1, 0, 0.7568628, 1,
1.05618, -2.134571, 2.734619, 1, 0, 0.7490196, 1,
1.063139, 0.6064599, 1.43286, 1, 0, 0.7450981, 1,
1.063339, 0.007413832, 1.303865, 1, 0, 0.7372549, 1,
1.064891, -0.7810502, 2.832165, 1, 0, 0.7333333, 1,
1.067143, -0.7322236, 3.12292, 1, 0, 0.7254902, 1,
1.076619, -0.4451085, 1.740751, 1, 0, 0.7215686, 1,
1.084628, 2.554449, 0.4833036, 1, 0, 0.7137255, 1,
1.093499, 0.5917246, 1.365906, 1, 0, 0.7098039, 1,
1.098267, 0.1927096, 1.041062, 1, 0, 0.7019608, 1,
1.102187, -0.572795, 3.173701, 1, 0, 0.6941177, 1,
1.105762, -0.6588508, 2.24674, 1, 0, 0.6901961, 1,
1.112588, 0.04929649, 0.9524084, 1, 0, 0.682353, 1,
1.116177, -0.001443666, 2.414594, 1, 0, 0.6784314, 1,
1.119845, -0.9130085, 2.447853, 1, 0, 0.6705883, 1,
1.12351, 0.8026546, 1.725016, 1, 0, 0.6666667, 1,
1.137052, 0.4770582, 1.871537, 1, 0, 0.6588235, 1,
1.139122, 0.5888668, 1.040635, 1, 0, 0.654902, 1,
1.14476, -1.087073, 3.025743, 1, 0, 0.6470588, 1,
1.144766, -1.252334, 1.436724, 1, 0, 0.6431373, 1,
1.145955, -0.5879244, 1.951783, 1, 0, 0.6352941, 1,
1.146662, -1.526496, 3.787482, 1, 0, 0.6313726, 1,
1.149993, -1.124629, 2.158046, 1, 0, 0.6235294, 1,
1.157557, -0.2761841, 3.004895, 1, 0, 0.6196079, 1,
1.159934, -0.6306374, 2.426787, 1, 0, 0.6117647, 1,
1.160821, -0.1133275, 1.297302, 1, 0, 0.6078432, 1,
1.164759, 0.7953634, -0.0940937, 1, 0, 0.6, 1,
1.171476, 0.8322762, 0.6863335, 1, 0, 0.5921569, 1,
1.179067, 0.907195, -1.218236, 1, 0, 0.5882353, 1,
1.179432, 1.608871, 0.904572, 1, 0, 0.5803922, 1,
1.183683, -0.9580486, 2.118276, 1, 0, 0.5764706, 1,
1.190131, 0.5302458, 1.094291, 1, 0, 0.5686275, 1,
1.201144, -1.46478, 3.265436, 1, 0, 0.5647059, 1,
1.214714, 0.3979409, 1.674776, 1, 0, 0.5568628, 1,
1.229079, -0.05227366, 2.115074, 1, 0, 0.5529412, 1,
1.232283, -0.1037344, 1.025314, 1, 0, 0.5450981, 1,
1.234808, 0.07129245, 2.11495, 1, 0, 0.5411765, 1,
1.236076, -0.758674, 1.498058, 1, 0, 0.5333334, 1,
1.238063, 0.6650332, 1.237867, 1, 0, 0.5294118, 1,
1.248529, -1.606926, 2.537592, 1, 0, 0.5215687, 1,
1.253138, 0.01308972, 0.9377599, 1, 0, 0.5176471, 1,
1.257504, -1.449356, 3.610757, 1, 0, 0.509804, 1,
1.259984, -1.046318, 3.967629, 1, 0, 0.5058824, 1,
1.261478, 2.377887, 2.104214, 1, 0, 0.4980392, 1,
1.293642, 1.07101, 0.6332145, 1, 0, 0.4901961, 1,
1.293908, -1.181185, 1.844252, 1, 0, 0.4862745, 1,
1.299477, 1.164379, 1.09344, 1, 0, 0.4784314, 1,
1.311156, -1.254888, 2.885512, 1, 0, 0.4745098, 1,
1.31913, 1.073306, 0.6816748, 1, 0, 0.4666667, 1,
1.322919, 1.017259, 0.9454926, 1, 0, 0.4627451, 1,
1.32301, 0.3774524, 0.1189522, 1, 0, 0.454902, 1,
1.327116, -0.2290902, 1.481483, 1, 0, 0.4509804, 1,
1.330575, 0.173639, -1.582422, 1, 0, 0.4431373, 1,
1.352332, -0.6516681, 1.872486, 1, 0, 0.4392157, 1,
1.381688, 0.4306, 0.7308002, 1, 0, 0.4313726, 1,
1.382924, -2.629662, 2.919349, 1, 0, 0.427451, 1,
1.386476, 0.2812225, 2.060521, 1, 0, 0.4196078, 1,
1.38915, -0.2610364, 2.046603, 1, 0, 0.4156863, 1,
1.399551, 0.5107912, 0.9259506, 1, 0, 0.4078431, 1,
1.403622, -1.558166, 3.210663, 1, 0, 0.4039216, 1,
1.414148, -0.4382732, 1.217738, 1, 0, 0.3960784, 1,
1.414389, -0.120966, 1.174741, 1, 0, 0.3882353, 1,
1.416043, 0.2273234, 0.4360776, 1, 0, 0.3843137, 1,
1.4192, -0.5362596, 1.535475, 1, 0, 0.3764706, 1,
1.420722, -0.3260014, 0.6028404, 1, 0, 0.372549, 1,
1.422336, 0.1857407, 2.053509, 1, 0, 0.3647059, 1,
1.448567, -1.199472, 3.059799, 1, 0, 0.3607843, 1,
1.454715, 0.6810571, 1.320197, 1, 0, 0.3529412, 1,
1.456117, 0.3736031, 0.3855303, 1, 0, 0.3490196, 1,
1.466906, -0.3852643, 2.000702, 1, 0, 0.3411765, 1,
1.467036, 1.337856, -0.4346683, 1, 0, 0.3372549, 1,
1.482921, -0.4723555, 1.372611, 1, 0, 0.3294118, 1,
1.51177, -0.4924934, 1.424368, 1, 0, 0.3254902, 1,
1.511964, 1.674664, 0.3004229, 1, 0, 0.3176471, 1,
1.526931, 1.285968, 2.296301, 1, 0, 0.3137255, 1,
1.52992, 2.359026, -1.073995, 1, 0, 0.3058824, 1,
1.53074, 0.393474, 1.709599, 1, 0, 0.2980392, 1,
1.546842, -0.7702972, 3.080227, 1, 0, 0.2941177, 1,
1.576208, -1.663918, 2.81008, 1, 0, 0.2862745, 1,
1.578586, -0.4890179, 0.3677734, 1, 0, 0.282353, 1,
1.579139, 1.46875, -0.8744791, 1, 0, 0.2745098, 1,
1.5905, -0.6157256, 1.788495, 1, 0, 0.2705882, 1,
1.602237, -2.673211, 2.159951, 1, 0, 0.2627451, 1,
1.623734, 1.023034, 0.6203616, 1, 0, 0.2588235, 1,
1.671115, 0.3680998, 1.017156, 1, 0, 0.2509804, 1,
1.693212, -0.5292944, 2.235015, 1, 0, 0.2470588, 1,
1.71403, 0.3450042, 3.065161, 1, 0, 0.2392157, 1,
1.722415, -1.268026, 3.518108, 1, 0, 0.2352941, 1,
1.727809, 0.3996687, -0.5295821, 1, 0, 0.227451, 1,
1.730674, 1.306257, 1.327728, 1, 0, 0.2235294, 1,
1.75683, -0.7211251, 2.207451, 1, 0, 0.2156863, 1,
1.769712, 1.585513, 1.350183, 1, 0, 0.2117647, 1,
1.789394, -0.6176698, 1.404099, 1, 0, 0.2039216, 1,
1.795767, -0.05157524, 0.9999791, 1, 0, 0.1960784, 1,
1.79707, 0.03543165, 1.67487, 1, 0, 0.1921569, 1,
1.809666, 1.335259, 2.280815, 1, 0, 0.1843137, 1,
1.81657, -0.5010662, 1.052772, 1, 0, 0.1803922, 1,
1.826613, 1.339355, 0.7957975, 1, 0, 0.172549, 1,
1.82709, -1.582142, 3.309902, 1, 0, 0.1686275, 1,
1.829732, -0.4462423, 3.189659, 1, 0, 0.1607843, 1,
1.835534, 0.3250753, 0.1292402, 1, 0, 0.1568628, 1,
1.856049, -0.08834861, 3.102107, 1, 0, 0.1490196, 1,
1.880175, -0.5348282, 1.771977, 1, 0, 0.145098, 1,
1.90452, -0.1809287, 1.966026, 1, 0, 0.1372549, 1,
1.93482, 1.434169, 1.276421, 1, 0, 0.1333333, 1,
1.955121, -0.7719269, 1.987093, 1, 0, 0.1254902, 1,
2.006709, 0.06183314, 1.734762, 1, 0, 0.1215686, 1,
2.024983, 0.22957, 0.2574394, 1, 0, 0.1137255, 1,
2.032091, 0.8564234, 2.487951, 1, 0, 0.1098039, 1,
2.053793, 0.9510909, 0.5008198, 1, 0, 0.1019608, 1,
2.060111, -1.850699, 1.895554, 1, 0, 0.09411765, 1,
2.062137, 1.142976, 0.6719843, 1, 0, 0.09019608, 1,
2.088856, -0.4008956, 1.589941, 1, 0, 0.08235294, 1,
2.190524, 0.5724687, 0.7699779, 1, 0, 0.07843138, 1,
2.204472, 0.7590441, 0.8899611, 1, 0, 0.07058824, 1,
2.313779, -0.7331393, 2.079831, 1, 0, 0.06666667, 1,
2.359745, 0.8924394, 2.288233, 1, 0, 0.05882353, 1,
2.362052, -0.6774531, 2.518276, 1, 0, 0.05490196, 1,
2.378585, -2.229252, 1.267683, 1, 0, 0.04705882, 1,
2.414296, 0.3844386, 2.596103, 1, 0, 0.04313726, 1,
2.45516, 2.407116, -1.466372, 1, 0, 0.03529412, 1,
2.552112, 0.06562448, 0.8411115, 1, 0, 0.03137255, 1,
2.575188, -0.6768953, 0.471574, 1, 0, 0.02352941, 1,
3.130235, 0.7125761, 1.407136, 1, 0, 0.01960784, 1,
3.21249, 0.9304009, 2.154577, 1, 0, 0.01176471, 1,
3.855625, -0.7883872, 0.7245446, 1, 0, 0.007843138, 1
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
0.5373055, -3.923366, -6.922558, 0, -0.5, 0.5, 0.5,
0.5373055, -3.923366, -6.922558, 1, -0.5, 0.5, 0.5,
0.5373055, -3.923366, -6.922558, 1, 1.5, 0.5, 0.5,
0.5373055, -3.923366, -6.922558, 0, 1.5, 0.5, 0.5
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
-3.905925, 0.01067305, -6.922558, 0, -0.5, 0.5, 0.5,
-3.905925, 0.01067305, -6.922558, 1, -0.5, 0.5, 0.5,
-3.905925, 0.01067305, -6.922558, 1, 1.5, 0.5, 0.5,
-3.905925, 0.01067305, -6.922558, 0, 1.5, 0.5, 0.5
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
-3.905925, -3.923366, 0.2054987, 0, -0.5, 0.5, 0.5,
-3.905925, -3.923366, 0.2054987, 1, -0.5, 0.5, 0.5,
-3.905925, -3.923366, 0.2054987, 1, 1.5, 0.5, 0.5,
-3.905925, -3.923366, 0.2054987, 0, 1.5, 0.5, 0.5
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
-2, -3.015511, -5.277622,
3, -3.015511, -5.277622,
-2, -3.015511, -5.277622,
-2, -3.16682, -5.551778,
-1, -3.015511, -5.277622,
-1, -3.16682, -5.551778,
0, -3.015511, -5.277622,
0, -3.16682, -5.551778,
1, -3.015511, -5.277622,
1, -3.16682, -5.551778,
2, -3.015511, -5.277622,
2, -3.16682, -5.551778,
3, -3.015511, -5.277622,
3, -3.16682, -5.551778
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
-2, -3.469439, -6.10009, 0, -0.5, 0.5, 0.5,
-2, -3.469439, -6.10009, 1, -0.5, 0.5, 0.5,
-2, -3.469439, -6.10009, 1, 1.5, 0.5, 0.5,
-2, -3.469439, -6.10009, 0, 1.5, 0.5, 0.5,
-1, -3.469439, -6.10009, 0, -0.5, 0.5, 0.5,
-1, -3.469439, -6.10009, 1, -0.5, 0.5, 0.5,
-1, -3.469439, -6.10009, 1, 1.5, 0.5, 0.5,
-1, -3.469439, -6.10009, 0, 1.5, 0.5, 0.5,
0, -3.469439, -6.10009, 0, -0.5, 0.5, 0.5,
0, -3.469439, -6.10009, 1, -0.5, 0.5, 0.5,
0, -3.469439, -6.10009, 1, 1.5, 0.5, 0.5,
0, -3.469439, -6.10009, 0, 1.5, 0.5, 0.5,
1, -3.469439, -6.10009, 0, -0.5, 0.5, 0.5,
1, -3.469439, -6.10009, 1, -0.5, 0.5, 0.5,
1, -3.469439, -6.10009, 1, 1.5, 0.5, 0.5,
1, -3.469439, -6.10009, 0, 1.5, 0.5, 0.5,
2, -3.469439, -6.10009, 0, -0.5, 0.5, 0.5,
2, -3.469439, -6.10009, 1, -0.5, 0.5, 0.5,
2, -3.469439, -6.10009, 1, 1.5, 0.5, 0.5,
2, -3.469439, -6.10009, 0, 1.5, 0.5, 0.5,
3, -3.469439, -6.10009, 0, -0.5, 0.5, 0.5,
3, -3.469439, -6.10009, 1, -0.5, 0.5, 0.5,
3, -3.469439, -6.10009, 1, 1.5, 0.5, 0.5,
3, -3.469439, -6.10009, 0, 1.5, 0.5, 0.5
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
-2.880564, -2, -5.277622,
-2.880564, 2, -5.277622,
-2.880564, -2, -5.277622,
-3.051457, -2, -5.551778,
-2.880564, -1, -5.277622,
-3.051457, -1, -5.551778,
-2.880564, 0, -5.277622,
-3.051457, 0, -5.551778,
-2.880564, 1, -5.277622,
-3.051457, 1, -5.551778,
-2.880564, 2, -5.277622,
-3.051457, 2, -5.551778
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
-3.393245, -2, -6.10009, 0, -0.5, 0.5, 0.5,
-3.393245, -2, -6.10009, 1, -0.5, 0.5, 0.5,
-3.393245, -2, -6.10009, 1, 1.5, 0.5, 0.5,
-3.393245, -2, -6.10009, 0, 1.5, 0.5, 0.5,
-3.393245, -1, -6.10009, 0, -0.5, 0.5, 0.5,
-3.393245, -1, -6.10009, 1, -0.5, 0.5, 0.5,
-3.393245, -1, -6.10009, 1, 1.5, 0.5, 0.5,
-3.393245, -1, -6.10009, 0, 1.5, 0.5, 0.5,
-3.393245, 0, -6.10009, 0, -0.5, 0.5, 0.5,
-3.393245, 0, -6.10009, 1, -0.5, 0.5, 0.5,
-3.393245, 0, -6.10009, 1, 1.5, 0.5, 0.5,
-3.393245, 0, -6.10009, 0, 1.5, 0.5, 0.5,
-3.393245, 1, -6.10009, 0, -0.5, 0.5, 0.5,
-3.393245, 1, -6.10009, 1, -0.5, 0.5, 0.5,
-3.393245, 1, -6.10009, 1, 1.5, 0.5, 0.5,
-3.393245, 1, -6.10009, 0, 1.5, 0.5, 0.5,
-3.393245, 2, -6.10009, 0, -0.5, 0.5, 0.5,
-3.393245, 2, -6.10009, 1, -0.5, 0.5, 0.5,
-3.393245, 2, -6.10009, 1, 1.5, 0.5, 0.5,
-3.393245, 2, -6.10009, 0, 1.5, 0.5, 0.5
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
-2.880564, -3.015511, -4,
-2.880564, -3.015511, 4,
-2.880564, -3.015511, -4,
-3.051457, -3.16682, -4,
-2.880564, -3.015511, -2,
-3.051457, -3.16682, -2,
-2.880564, -3.015511, 0,
-3.051457, -3.16682, 0,
-2.880564, -3.015511, 2,
-3.051457, -3.16682, 2,
-2.880564, -3.015511, 4,
-3.051457, -3.16682, 4
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
-3.393245, -3.469439, -4, 0, -0.5, 0.5, 0.5,
-3.393245, -3.469439, -4, 1, -0.5, 0.5, 0.5,
-3.393245, -3.469439, -4, 1, 1.5, 0.5, 0.5,
-3.393245, -3.469439, -4, 0, 1.5, 0.5, 0.5,
-3.393245, -3.469439, -2, 0, -0.5, 0.5, 0.5,
-3.393245, -3.469439, -2, 1, -0.5, 0.5, 0.5,
-3.393245, -3.469439, -2, 1, 1.5, 0.5, 0.5,
-3.393245, -3.469439, -2, 0, 1.5, 0.5, 0.5,
-3.393245, -3.469439, 0, 0, -0.5, 0.5, 0.5,
-3.393245, -3.469439, 0, 1, -0.5, 0.5, 0.5,
-3.393245, -3.469439, 0, 1, 1.5, 0.5, 0.5,
-3.393245, -3.469439, 0, 0, 1.5, 0.5, 0.5,
-3.393245, -3.469439, 2, 0, -0.5, 0.5, 0.5,
-3.393245, -3.469439, 2, 1, -0.5, 0.5, 0.5,
-3.393245, -3.469439, 2, 1, 1.5, 0.5, 0.5,
-3.393245, -3.469439, 2, 0, 1.5, 0.5, 0.5,
-3.393245, -3.469439, 4, 0, -0.5, 0.5, 0.5,
-3.393245, -3.469439, 4, 1, -0.5, 0.5, 0.5,
-3.393245, -3.469439, 4, 1, 1.5, 0.5, 0.5,
-3.393245, -3.469439, 4, 0, 1.5, 0.5, 0.5
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
-2.880564, -3.015511, -5.277622,
-2.880564, 3.036857, -5.277622,
-2.880564, -3.015511, 5.68862,
-2.880564, 3.036857, 5.68862,
-2.880564, -3.015511, -5.277622,
-2.880564, -3.015511, 5.68862,
-2.880564, 3.036857, -5.277622,
-2.880564, 3.036857, 5.68862,
-2.880564, -3.015511, -5.277622,
3.955175, -3.015511, -5.277622,
-2.880564, -3.015511, 5.68862,
3.955175, -3.015511, 5.68862,
-2.880564, 3.036857, -5.277622,
3.955175, 3.036857, -5.277622,
-2.880564, 3.036857, 5.68862,
3.955175, 3.036857, 5.68862,
3.955175, -3.015511, -5.277622,
3.955175, 3.036857, -5.277622,
3.955175, -3.015511, 5.68862,
3.955175, 3.036857, 5.68862,
3.955175, -3.015511, -5.277622,
3.955175, -3.015511, 5.68862,
3.955175, 3.036857, -5.277622,
3.955175, 3.036857, 5.68862
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
var radius = 7.619604;
var distance = 33.90048;
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
mvMatrix.translate( -0.5373055, -0.01067305, -0.2054987 );
mvMatrix.scale( 1.205205, 1.361197, 0.751257 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.90048);
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
thiocyclam<-read.table("thiocyclam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiocyclam$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiocyclam' not found
```

```r
y<-thiocyclam$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiocyclam' not found
```

```r
z<-thiocyclam$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiocyclam' not found
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
-2.781014, -2.072798, -2.946586, 0, 0, 1, 1, 1,
-2.720999, 0.5684631, -2.174164, 1, 0, 0, 1, 1,
-2.671989, 0.8001861, 0.02330723, 1, 0, 0, 1, 1,
-2.608613, 0.8767152, -0.4630835, 1, 0, 0, 1, 1,
-2.554665, 0.7664136, -3.529477, 1, 0, 0, 1, 1,
-2.541409, 2.948716, -0.552339, 1, 0, 0, 1, 1,
-2.46903, 0.009458876, -3.358201, 0, 0, 0, 1, 1,
-2.436356, -0.8752155, -1.69127, 0, 0, 0, 1, 1,
-2.405869, 0.6683155, -2.114138, 0, 0, 0, 1, 1,
-2.384126, 0.137656, -1.776912, 0, 0, 0, 1, 1,
-2.337755, -0.8618734, -0.3154225, 0, 0, 0, 1, 1,
-2.294323, 1.147977, -2.26888, 0, 0, 0, 1, 1,
-2.279302, 0.07619579, -1.004228, 0, 0, 0, 1, 1,
-2.274309, 1.466748, -2.415431, 1, 1, 1, 1, 1,
-2.245764, -0.1992178, -1.784224, 1, 1, 1, 1, 1,
-2.229693, 0.7662467, -0.3971874, 1, 1, 1, 1, 1,
-2.227535, -0.8759257, -2.433293, 1, 1, 1, 1, 1,
-2.223132, 1.071772, -2.529007, 1, 1, 1, 1, 1,
-2.213069, -2.169829, -2.60562, 1, 1, 1, 1, 1,
-2.176292, -0.02309046, -1.212757, 1, 1, 1, 1, 1,
-2.149818, 0.03745665, -0.4760573, 1, 1, 1, 1, 1,
-2.119807, 1.612788, 0.869457, 1, 1, 1, 1, 1,
-2.086838, -0.9206196, -1.554007, 1, 1, 1, 1, 1,
-2.057602, -1.032826, -2.575774, 1, 1, 1, 1, 1,
-2.054969, 1.345596, -0.6065326, 1, 1, 1, 1, 1,
-2.054744, 0.5617885, 0.1538002, 1, 1, 1, 1, 1,
-2.029093, -0.0202043, -2.068034, 1, 1, 1, 1, 1,
-2.004308, -0.8544698, -0.4003634, 1, 1, 1, 1, 1,
-1.992961, -0.2554529, -3.000486, 0, 0, 1, 1, 1,
-1.979149, -0.7185017, -0.8824311, 1, 0, 0, 1, 1,
-1.9192, 0.1854489, -1.387965, 1, 0, 0, 1, 1,
-1.911782, 1.546499, -0.7577715, 1, 0, 0, 1, 1,
-1.907688, -0.1744849, -0.7361335, 1, 0, 0, 1, 1,
-1.870143, 0.4278267, -1.181836, 1, 0, 0, 1, 1,
-1.852666, 0.2306853, -1.989351, 0, 0, 0, 1, 1,
-1.849962, -0.0771558, -3.559108, 0, 0, 0, 1, 1,
-1.848786, 1.257468, -0.5800814, 0, 0, 0, 1, 1,
-1.826891, 0.1773331, -0.7134902, 0, 0, 0, 1, 1,
-1.7519, 0.05692685, -0.9860148, 0, 0, 0, 1, 1,
-1.735727, 0.4494371, -1.742111, 0, 0, 0, 1, 1,
-1.715462, -1.036796, -2.260036, 0, 0, 0, 1, 1,
-1.705806, -1.8839, -2.482593, 1, 1, 1, 1, 1,
-1.689738, 1.859388, 0.6525812, 1, 1, 1, 1, 1,
-1.678948, -0.7657231, -3.23135, 1, 1, 1, 1, 1,
-1.670108, 0.2204863, -0.4844808, 1, 1, 1, 1, 1,
-1.666577, -0.1165782, -1.619677, 1, 1, 1, 1, 1,
-1.663974, -1.899598, -3.487741, 1, 1, 1, 1, 1,
-1.638657, -0.9463345, -2.445798, 1, 1, 1, 1, 1,
-1.636351, -0.8655102, -2.433221, 1, 1, 1, 1, 1,
-1.626458, 0.0202129, -0.8857328, 1, 1, 1, 1, 1,
-1.607937, 0.6882918, -3.529574, 1, 1, 1, 1, 1,
-1.592649, -0.6065419, -0.411268, 1, 1, 1, 1, 1,
-1.586709, -0.7382967, -2.764224, 1, 1, 1, 1, 1,
-1.573055, 0.06014595, -1.604412, 1, 1, 1, 1, 1,
-1.563933, -0.9334704, -3.273787, 1, 1, 1, 1, 1,
-1.544912, 0.9036536, -1.128812, 1, 1, 1, 1, 1,
-1.534362, -0.4193887, -2.496238, 0, 0, 1, 1, 1,
-1.531271, 0.01000093, -2.44338, 1, 0, 0, 1, 1,
-1.526784, -0.4392913, -1.619838, 1, 0, 0, 1, 1,
-1.525107, -0.3545725, -1.390565, 1, 0, 0, 1, 1,
-1.521786, -0.6300099, -1.534252, 1, 0, 0, 1, 1,
-1.515581, -0.5415403, -1.97741, 1, 0, 0, 1, 1,
-1.4683, 1.295737, -0.06860168, 0, 0, 0, 1, 1,
-1.467913, -1.152642, -3.015285, 0, 0, 0, 1, 1,
-1.449561, -0.3834291, -1.837994, 0, 0, 0, 1, 1,
-1.420059, 1.810775, -1.298774, 0, 0, 0, 1, 1,
-1.409811, 0.7703543, -1.748002, 0, 0, 0, 1, 1,
-1.398355, -2.233102, -1.609341, 0, 0, 0, 1, 1,
-1.395481, 0.6483519, -1.929983, 0, 0, 0, 1, 1,
-1.39473, 0.9335916, -0.9389803, 1, 1, 1, 1, 1,
-1.387248, -1.257101, -2.48728, 1, 1, 1, 1, 1,
-1.384261, 0.8570879, 0.08618899, 1, 1, 1, 1, 1,
-1.371442, -0.4865678, -1.477155, 1, 1, 1, 1, 1,
-1.369206, -0.3429135, -2.988017, 1, 1, 1, 1, 1,
-1.360111, -1.637492, -1.761227, 1, 1, 1, 1, 1,
-1.351752, -2.071103, -3.511937, 1, 1, 1, 1, 1,
-1.350747, -0.2218489, -3.19369, 1, 1, 1, 1, 1,
-1.337269, 1.032038, 0.4064863, 1, 1, 1, 1, 1,
-1.337051, 0.8487763, -0.6283053, 1, 1, 1, 1, 1,
-1.332435, 0.7128279, -2.215747, 1, 1, 1, 1, 1,
-1.313619, 0.7118679, -0.6872684, 1, 1, 1, 1, 1,
-1.308073, 0.5533389, -1.706985, 1, 1, 1, 1, 1,
-1.294233, 2.098776, -0.3623569, 1, 1, 1, 1, 1,
-1.281356, -0.08797204, -0.7882552, 1, 1, 1, 1, 1,
-1.280959, 0.1460866, -1.67625, 0, 0, 1, 1, 1,
-1.263849, -0.3904332, -0.221794, 1, 0, 0, 1, 1,
-1.261004, 0.4710243, -1.175047, 1, 0, 0, 1, 1,
-1.250398, 1.050956, -1.527643, 1, 0, 0, 1, 1,
-1.245679, -1.6955, -3.450159, 1, 0, 0, 1, 1,
-1.244807, 1.42228, 1.294494, 1, 0, 0, 1, 1,
-1.243747, -1.037283, -3.723645, 0, 0, 0, 1, 1,
-1.243317, 0.7733901, 0.7865387, 0, 0, 0, 1, 1,
-1.23905, -0.7584329, -0.9632075, 0, 0, 0, 1, 1,
-1.233237, 0.3181651, -0.03678349, 0, 0, 0, 1, 1,
-1.231007, -0.7321404, -3.028005, 0, 0, 0, 1, 1,
-1.227401, -1.317884, -1.879349, 0, 0, 0, 1, 1,
-1.224344, 0.7852349, -0.06854025, 0, 0, 0, 1, 1,
-1.208394, 1.274425, -0.04260986, 1, 1, 1, 1, 1,
-1.199914, -0.04152406, -1.535203, 1, 1, 1, 1, 1,
-1.182824, 0.8753485, -0.2163819, 1, 1, 1, 1, 1,
-1.181679, 0.3671849, -1.804341, 1, 1, 1, 1, 1,
-1.179186, 0.02478759, -3.400842, 1, 1, 1, 1, 1,
-1.167432, 1.330052, -1.75887, 1, 1, 1, 1, 1,
-1.167109, -0.8916658, -1.85818, 1, 1, 1, 1, 1,
-1.147167, -0.6338653, -0.9554149, 1, 1, 1, 1, 1,
-1.137277, 0.4602242, -0.8393757, 1, 1, 1, 1, 1,
-1.134633, -0.619437, -2.238196, 1, 1, 1, 1, 1,
-1.125404, 0.9114651, -0.9130881, 1, 1, 1, 1, 1,
-1.124592, 0.01596505, -2.475504, 1, 1, 1, 1, 1,
-1.119556, -1.251559, -3.309314, 1, 1, 1, 1, 1,
-1.083697, 1.579225, -1.536, 1, 1, 1, 1, 1,
-1.076185, 0.7854098, -0.4410839, 1, 1, 1, 1, 1,
-1.074672, -0.6062946, -2.176843, 0, 0, 1, 1, 1,
-1.073411, 1.185799, 0.3398724, 1, 0, 0, 1, 1,
-1.052976, 0.7471544, -2.556036, 1, 0, 0, 1, 1,
-1.031248, 0.7273556, -0.8222176, 1, 0, 0, 1, 1,
-1.031109, 1.404927, -1.10987, 1, 0, 0, 1, 1,
-1.024386, 0.2137291, -1.376478, 1, 0, 0, 1, 1,
-1.021257, 1.511981, -0.3898588, 0, 0, 0, 1, 1,
-1.017009, -1.551576, -2.887161, 0, 0, 0, 1, 1,
-1.013932, -0.06092684, -1.146252, 0, 0, 0, 1, 1,
-1.01137, 0.3900099, -1.260759, 0, 0, 0, 1, 1,
-1.008948, -0.1348635, -2.510992, 0, 0, 0, 1, 1,
-1.006387, -0.1305189, -2.730259, 0, 0, 0, 1, 1,
-1.005261, -0.311876, -1.392901, 0, 0, 0, 1, 1,
-1.00383, 1.096851, -0.887264, 1, 1, 1, 1, 1,
-1.002041, 0.3035915, -1.659993, 1, 1, 1, 1, 1,
-0.991338, 0.731739, -0.6363164, 1, 1, 1, 1, 1,
-0.9896016, -0.2937399, -0.1839514, 1, 1, 1, 1, 1,
-0.9878559, 0.7325872, 0.4475945, 1, 1, 1, 1, 1,
-0.9788876, 0.1043706, -1.684742, 1, 1, 1, 1, 1,
-0.9783342, -0.3249296, -0.5788228, 1, 1, 1, 1, 1,
-0.9736735, -1.071408, -2.771235, 1, 1, 1, 1, 1,
-0.9717228, -0.04892731, -3.290168, 1, 1, 1, 1, 1,
-0.9694766, 0.3536542, 0.5987151, 1, 1, 1, 1, 1,
-0.9656406, -1.262608, -2.324438, 1, 1, 1, 1, 1,
-0.9612669, 1.005955, -0.8719649, 1, 1, 1, 1, 1,
-0.9612004, 0.4457669, -1.836228, 1, 1, 1, 1, 1,
-0.9586502, 1.586539, 0.6918189, 1, 1, 1, 1, 1,
-0.9499109, -0.9632662, -3.350298, 1, 1, 1, 1, 1,
-0.9459208, -1.558786, -1.323158, 0, 0, 1, 1, 1,
-0.9440846, -0.9223371, -3.733216, 1, 0, 0, 1, 1,
-0.9439422, -1.01346, -1.476621, 1, 0, 0, 1, 1,
-0.9425522, 0.665428, -2.549144, 1, 0, 0, 1, 1,
-0.9377078, -0.5204448, -1.064705, 1, 0, 0, 1, 1,
-0.9357269, 1.204189, -1.544936, 1, 0, 0, 1, 1,
-0.9355569, -0.1819102, -1.386158, 0, 0, 0, 1, 1,
-0.9349625, -0.776663, -1.218361, 0, 0, 0, 1, 1,
-0.9316859, 0.3331354, -1.574267, 0, 0, 0, 1, 1,
-0.9304969, -0.3958444, -1.40878, 0, 0, 0, 1, 1,
-0.9298014, -0.9267783, -1.286385, 0, 0, 0, 1, 1,
-0.9285284, 0.7043159, -2.145578, 0, 0, 0, 1, 1,
-0.926468, -0.4281873, -2.736296, 0, 0, 0, 1, 1,
-0.9258496, 0.5815833, -2.470124, 1, 1, 1, 1, 1,
-0.9201824, 0.7608818, -0.9479095, 1, 1, 1, 1, 1,
-0.9176573, 1.288308, -0.3641197, 1, 1, 1, 1, 1,
-0.9171301, -0.08947059, -2.060209, 1, 1, 1, 1, 1,
-0.9159972, 2.125144, 0.5834179, 1, 1, 1, 1, 1,
-0.9123103, 1.12067, -0.5948563, 1, 1, 1, 1, 1,
-0.9088322, -1.185828, -2.808124, 1, 1, 1, 1, 1,
-0.9017033, 0.5340164, -0.9239911, 1, 1, 1, 1, 1,
-0.8969888, -0.8173886, -1.444149, 1, 1, 1, 1, 1,
-0.8925326, -0.9775998, -3.800121, 1, 1, 1, 1, 1,
-0.8920426, -0.4449166, -1.588476, 1, 1, 1, 1, 1,
-0.8886492, 0.6142312, -2.068881, 1, 1, 1, 1, 1,
-0.8886406, -1.873701, -2.607116, 1, 1, 1, 1, 1,
-0.8737556, -0.4313185, -1.361524, 1, 1, 1, 1, 1,
-0.8716581, 0.6915184, -3.765227, 1, 1, 1, 1, 1,
-0.8691818, -1.980366, -4.582037, 0, 0, 1, 1, 1,
-0.8599114, -0.6054738, -1.594351, 1, 0, 0, 1, 1,
-0.8587607, 0.5874188, -1.505135, 1, 0, 0, 1, 1,
-0.8527848, 0.8623629, -1.635531, 1, 0, 0, 1, 1,
-0.849959, -0.4290343, -3.857775, 1, 0, 0, 1, 1,
-0.8470316, 0.2522646, -1.098936, 1, 0, 0, 1, 1,
-0.8465579, 0.6768563, -0.4885435, 0, 0, 0, 1, 1,
-0.8418595, 0.848654, 0.1777835, 0, 0, 0, 1, 1,
-0.8382954, 0.2579457, -1.923606, 0, 0, 0, 1, 1,
-0.8298196, -0.4373894, -1.352985, 0, 0, 0, 1, 1,
-0.8294559, 0.007726606, -0.3791333, 0, 0, 0, 1, 1,
-0.8228514, -0.1977583, -3.45419, 0, 0, 0, 1, 1,
-0.822836, 1.147462, -2.93361, 0, 0, 0, 1, 1,
-0.8171027, -1.105316, -3.208207, 1, 1, 1, 1, 1,
-0.8164302, -0.5096204, 0.0500355, 1, 1, 1, 1, 1,
-0.8113998, -0.4837195, -1.148149, 1, 1, 1, 1, 1,
-0.8107648, 0.6073656, 0.6139022, 1, 1, 1, 1, 1,
-0.8105109, 1.046002, 0.5485464, 1, 1, 1, 1, 1,
-0.8104942, 0.4580652, -1.197294, 1, 1, 1, 1, 1,
-0.8101779, 0.1169939, -1.801489, 1, 1, 1, 1, 1,
-0.8083763, 0.2728044, -1.474897, 1, 1, 1, 1, 1,
-0.8074065, 2.638352, 0.2104393, 1, 1, 1, 1, 1,
-0.8065793, 1.17955, -0.3429749, 1, 1, 1, 1, 1,
-0.8045005, 0.2148411, -2.285502, 1, 1, 1, 1, 1,
-0.7991081, 0.3649015, -1.051986, 1, 1, 1, 1, 1,
-0.7958316, -0.4228888, -2.538557, 1, 1, 1, 1, 1,
-0.7940934, 0.8360855, -2.61602, 1, 1, 1, 1, 1,
-0.79394, 0.02364082, -1.279121, 1, 1, 1, 1, 1,
-0.7916316, -0.0218994, -0.972156, 0, 0, 1, 1, 1,
-0.7889743, 0.277371, -1.411503, 1, 0, 0, 1, 1,
-0.787319, -0.1135392, -2.319061, 1, 0, 0, 1, 1,
-0.7854568, -1.582255, -4.689, 1, 0, 0, 1, 1,
-0.7846561, -0.6919265, -5.117919, 1, 0, 0, 1, 1,
-0.7829414, -1.655835, -2.567253, 1, 0, 0, 1, 1,
-0.78292, 1.131875, -1.977222, 0, 0, 0, 1, 1,
-0.7825366, -0.9645451, -1.685729, 0, 0, 0, 1, 1,
-0.7819741, -0.2495093, -0.5825487, 0, 0, 0, 1, 1,
-0.7810438, -0.4610332, -2.092041, 0, 0, 0, 1, 1,
-0.7658706, -0.1491308, -2.04137, 0, 0, 0, 1, 1,
-0.7657562, 0.4017679, -1.743889, 0, 0, 0, 1, 1,
-0.7623326, -0.08417786, 0.7226322, 0, 0, 0, 1, 1,
-0.7573344, 0.4084529, -1.629991, 1, 1, 1, 1, 1,
-0.7452876, -0.7232795, -1.994, 1, 1, 1, 1, 1,
-0.7403644, -1.093903, -2.632034, 1, 1, 1, 1, 1,
-0.7378076, 1.213199, -0.006926999, 1, 1, 1, 1, 1,
-0.7306511, -0.6081165, -1.774011, 1, 1, 1, 1, 1,
-0.729488, -0.1383314, -2.103368, 1, 1, 1, 1, 1,
-0.7216141, -1.120715, -2.930252, 1, 1, 1, 1, 1,
-0.7202114, -0.2563058, -2.210757, 1, 1, 1, 1, 1,
-0.7190569, 0.4555901, -0.9252335, 1, 1, 1, 1, 1,
-0.7189256, -0.462634, -1.89249, 1, 1, 1, 1, 1,
-0.7181729, -0.67478, -1.836517, 1, 1, 1, 1, 1,
-0.7136588, 0.549059, -1.599216, 1, 1, 1, 1, 1,
-0.7080324, 2.47197, -1.445404, 1, 1, 1, 1, 1,
-0.7064728, 1.522604, 1.217611, 1, 1, 1, 1, 1,
-0.7016146, -1.971101, -2.918437, 1, 1, 1, 1, 1,
-0.6982133, -0.6935713, -1.501865, 0, 0, 1, 1, 1,
-0.6978007, 1.200042, 0.5232505, 1, 0, 0, 1, 1,
-0.6724628, -0.05745755, -2.075144, 1, 0, 0, 1, 1,
-0.6642638, -0.1192695, 0.9408461, 1, 0, 0, 1, 1,
-0.6593667, -1.613626, -2.432001, 1, 0, 0, 1, 1,
-0.6576772, -0.3598437, -0.6578596, 1, 0, 0, 1, 1,
-0.6467234, 1.611656, 0.2852116, 0, 0, 0, 1, 1,
-0.643972, -0.6555142, -1.396636, 0, 0, 0, 1, 1,
-0.6405436, 0.2895899, -0.9800368, 0, 0, 0, 1, 1,
-0.6358492, -0.2595508, -2.595515, 0, 0, 0, 1, 1,
-0.6351407, -0.7192509, -2.752813, 0, 0, 0, 1, 1,
-0.6305088, 1.258108, -0.008616031, 0, 0, 0, 1, 1,
-0.6299302, 0.1610453, -0.03557007, 0, 0, 0, 1, 1,
-0.6296837, 0.9773519, -1.238165, 1, 1, 1, 1, 1,
-0.6263632, -0.651735, -1.092513, 1, 1, 1, 1, 1,
-0.620642, 0.9573344, -0.1437661, 1, 1, 1, 1, 1,
-0.61869, -0.8563935, -3.143327, 1, 1, 1, 1, 1,
-0.6121491, -0.3638307, -4.801105, 1, 1, 1, 1, 1,
-0.6018621, -0.8827485, -0.1291062, 1, 1, 1, 1, 1,
-0.5946263, 0.9145976, -0.2858036, 1, 1, 1, 1, 1,
-0.5892942, -1.882991, -4.187959, 1, 1, 1, 1, 1,
-0.5843183, 0.2578876, 0.6213772, 1, 1, 1, 1, 1,
-0.580725, -0.4247977, -3.54358, 1, 1, 1, 1, 1,
-0.5793467, -0.5943715, -3.069314, 1, 1, 1, 1, 1,
-0.576219, 1.281344, 0.7718095, 1, 1, 1, 1, 1,
-0.5738673, -0.05543659, -2.601129, 1, 1, 1, 1, 1,
-0.5666991, -1.979281, -0.7599871, 1, 1, 1, 1, 1,
-0.5650552, -1.215105, -0.8570913, 1, 1, 1, 1, 1,
-0.5643166, -1.974275, -1.985947, 0, 0, 1, 1, 1,
-0.5626696, 0.04106689, -2.753538, 1, 0, 0, 1, 1,
-0.5615956, -0.3744535, -1.272238, 1, 0, 0, 1, 1,
-0.5608914, -1.406251, -2.764082, 1, 0, 0, 1, 1,
-0.5599807, 1.61667, 1.048759, 1, 0, 0, 1, 1,
-0.5591579, -2.92737, -4.147826, 1, 0, 0, 1, 1,
-0.5507579, 0.4400082, 0.136563, 0, 0, 0, 1, 1,
-0.5499266, -0.6753003, -3.149902, 0, 0, 0, 1, 1,
-0.5473337, 0.3346983, -0.3488129, 0, 0, 0, 1, 1,
-0.5371068, 2.100725, 0.7380331, 0, 0, 0, 1, 1,
-0.529586, -0.6271539, -1.312143, 0, 0, 0, 1, 1,
-0.5232282, 0.892944, -1.141526, 0, 0, 0, 1, 1,
-0.5228239, 0.4124733, 0.9090289, 0, 0, 0, 1, 1,
-0.5185658, -1.371803, -4.874865, 1, 1, 1, 1, 1,
-0.518074, -0.4002076, -1.579426, 1, 1, 1, 1, 1,
-0.5123106, -0.5324191, 0.3033498, 1, 1, 1, 1, 1,
-0.5073001, -0.7776706, -2.313928, 1, 1, 1, 1, 1,
-0.5054347, -0.253543, -2.573815, 1, 1, 1, 1, 1,
-0.5053925, -0.97216, -4.387114, 1, 1, 1, 1, 1,
-0.5004573, -0.5107551, -2.515935, 1, 1, 1, 1, 1,
-0.4865785, 0.9928624, 0.2156355, 1, 1, 1, 1, 1,
-0.4838567, 0.2365099, -2.254995, 1, 1, 1, 1, 1,
-0.4836978, 0.2006347, -0.2047594, 1, 1, 1, 1, 1,
-0.4828763, 0.1822975, -1.283418, 1, 1, 1, 1, 1,
-0.4805596, -0.6125014, -1.875186, 1, 1, 1, 1, 1,
-0.478336, -0.6244189, -1.13465, 1, 1, 1, 1, 1,
-0.4765928, -1.010911, -1.611133, 1, 1, 1, 1, 1,
-0.4729275, -1.084209, -4.304192, 1, 1, 1, 1, 1,
-0.4670914, 1.229282, 0.2141624, 0, 0, 1, 1, 1,
-0.4657005, 0.4234364, -1.257053, 1, 0, 0, 1, 1,
-0.4635743, -2.032988, -1.654191, 1, 0, 0, 1, 1,
-0.4621671, 0.7353868, -0.1386377, 1, 0, 0, 1, 1,
-0.4609125, -0.6530408, -2.46008, 1, 0, 0, 1, 1,
-0.4581451, 1.142634, -0.8009812, 1, 0, 0, 1, 1,
-0.4580299, 0.9973198, -0.8037095, 0, 0, 0, 1, 1,
-0.453286, -0.401575, -1.676978, 0, 0, 0, 1, 1,
-0.4480473, 0.8983253, 0.0368075, 0, 0, 0, 1, 1,
-0.4471352, -0.611351, -2.272285, 0, 0, 0, 1, 1,
-0.4463575, -2.542447, -3.097454, 0, 0, 0, 1, 1,
-0.4420547, 0.7938875, 0.08369423, 0, 0, 0, 1, 1,
-0.4417108, 0.3677305, -1.572902, 0, 0, 0, 1, 1,
-0.4352903, -0.509532, -2.072063, 1, 1, 1, 1, 1,
-0.4310279, 0.1720658, -1.112019, 1, 1, 1, 1, 1,
-0.4253377, 0.6759107, -2.701125, 1, 1, 1, 1, 1,
-0.4216456, 0.1444854, -1.350397, 1, 1, 1, 1, 1,
-0.4204198, -0.006301001, -2.004915, 1, 1, 1, 1, 1,
-0.4160738, -2.182145, -1.71038, 1, 1, 1, 1, 1,
-0.4153596, 1.262527, 0.3430883, 1, 1, 1, 1, 1,
-0.4122624, 1.550968, -0.301624, 1, 1, 1, 1, 1,
-0.4113993, 0.7159995, -2.552613, 1, 1, 1, 1, 1,
-0.4090472, -0.8307936, -2.126876, 1, 1, 1, 1, 1,
-0.4073128, -0.08956188, -1.755691, 1, 1, 1, 1, 1,
-0.4058898, -0.7171519, -2.106941, 1, 1, 1, 1, 1,
-0.4048147, -0.707771, -1.248525, 1, 1, 1, 1, 1,
-0.4045782, 0.5204256, -0.3942309, 1, 1, 1, 1, 1,
-0.4040159, -0.08739045, -2.055205, 1, 1, 1, 1, 1,
-0.3986251, 1.922346, 0.6522848, 0, 0, 1, 1, 1,
-0.3985038, 0.3402478, -1.280653, 1, 0, 0, 1, 1,
-0.3918076, -2.531134, -4.140347, 1, 0, 0, 1, 1,
-0.3874968, 0.2356058, -1.409251, 1, 0, 0, 1, 1,
-0.3872068, 1.770385, -1.413082, 1, 0, 0, 1, 1,
-0.3862945, 0.3037047, 0.05446149, 1, 0, 0, 1, 1,
-0.3847434, -1.795554, -2.268756, 0, 0, 0, 1, 1,
-0.3831765, -2.427501, -3.690385, 0, 0, 0, 1, 1,
-0.3715125, 0.3328347, -1.915225, 0, 0, 0, 1, 1,
-0.3683314, -0.7109059, -1.146273, 0, 0, 0, 1, 1,
-0.366409, -0.55865, -1.93554, 0, 0, 0, 1, 1,
-0.3607448, 1.824791, -0.6038541, 0, 0, 0, 1, 1,
-0.3602618, -0.3977404, -1.731678, 0, 0, 0, 1, 1,
-0.35848, -1.381977, -4.39409, 1, 1, 1, 1, 1,
-0.3567451, -1.355319, -2.746766, 1, 1, 1, 1, 1,
-0.3537635, 0.6400724, 0.3331588, 1, 1, 1, 1, 1,
-0.3533582, -2.642347, -3.620929, 1, 1, 1, 1, 1,
-0.3491801, -0.4763683, -3.298294, 1, 1, 1, 1, 1,
-0.3380057, 1.147537, -1.038954, 1, 1, 1, 1, 1,
-0.3341003, 0.1948947, -0.592806, 1, 1, 1, 1, 1,
-0.3325632, 0.7575083, -0.452666, 1, 1, 1, 1, 1,
-0.3312828, -0.9333788, -2.696251, 1, 1, 1, 1, 1,
-0.3299962, 0.2889439, -1.574725, 1, 1, 1, 1, 1,
-0.3289767, 0.4422681, 0.05199709, 1, 1, 1, 1, 1,
-0.3261435, 0.5051975, -0.6329978, 1, 1, 1, 1, 1,
-0.3259482, -1.445867, -3.048847, 1, 1, 1, 1, 1,
-0.3212838, 0.8964946, -1.911398, 1, 1, 1, 1, 1,
-0.320726, 0.8021277, -1.053734, 1, 1, 1, 1, 1,
-0.3177768, 1.814509, -0.3475602, 0, 0, 1, 1, 1,
-0.3171865, -0.353358, -1.413859, 1, 0, 0, 1, 1,
-0.3157116, 0.8386288, 0.4668156, 1, 0, 0, 1, 1,
-0.3138932, -0.5472949, -2.923425, 1, 0, 0, 1, 1,
-0.3065816, -0.9555131, -3.704405, 1, 0, 0, 1, 1,
-0.3056226, 0.5807935, -1.715353, 1, 0, 0, 1, 1,
-0.3047842, -0.9026139, -1.857635, 0, 0, 0, 1, 1,
-0.3039055, -0.855358, -2.280396, 0, 0, 0, 1, 1,
-0.3006561, 1.776228, 0.8079907, 0, 0, 0, 1, 1,
-0.3001361, -0.7274011, -4.001861, 0, 0, 0, 1, 1,
-0.2989124, 0.5176976, -1.19827, 0, 0, 0, 1, 1,
-0.2988652, 0.5422845, 1.557392, 0, 0, 0, 1, 1,
-0.2974849, -0.247178, -3.111447, 0, 0, 0, 1, 1,
-0.296774, -0.3768181, -0.6486812, 1, 1, 1, 1, 1,
-0.2951235, -0.7395953, -3.058906, 1, 1, 1, 1, 1,
-0.2908362, 0.4711192, -0.3765188, 1, 1, 1, 1, 1,
-0.289313, 0.515195, -0.2108584, 1, 1, 1, 1, 1,
-0.2886583, -0.1778912, -1.973623, 1, 1, 1, 1, 1,
-0.2876988, -0.286916, -1.933863, 1, 1, 1, 1, 1,
-0.2876946, 1.143407, -0.9672523, 1, 1, 1, 1, 1,
-0.2811837, -1.854915, -2.548747, 1, 1, 1, 1, 1,
-0.2724698, -0.598079, -2.801532, 1, 1, 1, 1, 1,
-0.2686037, -1.366063, -2.335378, 1, 1, 1, 1, 1,
-0.2677519, 0.1054333, -2.097018, 1, 1, 1, 1, 1,
-0.2650692, 0.4489341, 1.713593, 1, 1, 1, 1, 1,
-0.2601251, -1.541962, -3.078135, 1, 1, 1, 1, 1,
-0.2572002, -0.6458398, -3.996675, 1, 1, 1, 1, 1,
-0.2562239, -0.1257286, -3.827406, 1, 1, 1, 1, 1,
-0.2561215, 0.7720553, -0.769673, 0, 0, 1, 1, 1,
-0.2543741, -0.1836418, -2.067416, 1, 0, 0, 1, 1,
-0.2519086, 1.284303, 1.367554, 1, 0, 0, 1, 1,
-0.2518692, -1.813931, -1.108079, 1, 0, 0, 1, 1,
-0.2501447, 1.19139, 0.202742, 1, 0, 0, 1, 1,
-0.2397615, -0.7338083, -4.381094, 1, 0, 0, 1, 1,
-0.2359795, 0.3523605, -1.172904, 0, 0, 0, 1, 1,
-0.2288455, -1.215477, -0.2455392, 0, 0, 0, 1, 1,
-0.2271107, 1.395171, -0.5402055, 0, 0, 0, 1, 1,
-0.2181255, 0.29193, -2.063831, 0, 0, 0, 1, 1,
-0.2133332, 0.3488559, 1.344123, 0, 0, 0, 1, 1,
-0.2108074, 0.2225035, 1.426482, 0, 0, 0, 1, 1,
-0.208689, 0.1501773, -1.326441, 0, 0, 0, 1, 1,
-0.2084974, 0.7296748, -0.563563, 1, 1, 1, 1, 1,
-0.2082287, 0.3801267, 0.3157291, 1, 1, 1, 1, 1,
-0.2074687, 0.5594739, -0.547192, 1, 1, 1, 1, 1,
-0.2019771, -1.398119, -3.838947, 1, 1, 1, 1, 1,
-0.2012538, 0.9066496, -0.8455808, 1, 1, 1, 1, 1,
-0.1950842, 0.1005283, -2.42216, 1, 1, 1, 1, 1,
-0.1933919, -0.07285387, -3.336052, 1, 1, 1, 1, 1,
-0.1912524, -0.3169049, -2.779113, 1, 1, 1, 1, 1,
-0.185527, -1.023165, -3.582458, 1, 1, 1, 1, 1,
-0.185046, -0.5446557, -4.094628, 1, 1, 1, 1, 1,
-0.1845392, -0.4798929, -3.328309, 1, 1, 1, 1, 1,
-0.1825046, 1.863287, -0.1944974, 1, 1, 1, 1, 1,
-0.1804589, 0.9554748, -1.470433, 1, 1, 1, 1, 1,
-0.1765833, -1.609504, -4.751306, 1, 1, 1, 1, 1,
-0.1759714, 0.7622452, -1.028733, 1, 1, 1, 1, 1,
-0.1742473, -1.082889, -3.771509, 0, 0, 1, 1, 1,
-0.1738143, 0.1090657, -3.159405, 1, 0, 0, 1, 1,
-0.1733439, 1.705685, -1.306631, 1, 0, 0, 1, 1,
-0.1722483, -0.3849325, -2.438047, 1, 0, 0, 1, 1,
-0.1706818, 0.2833638, -0.7260896, 1, 0, 0, 1, 1,
-0.1706512, -0.4426264, -2.475701, 1, 0, 0, 1, 1,
-0.1687175, 1.470891, -0.6520557, 0, 0, 0, 1, 1,
-0.1643707, 0.08278866, -1.608237, 0, 0, 0, 1, 1,
-0.1591309, -2.423614, -3.173541, 0, 0, 0, 1, 1,
-0.1539355, -2.270935, -3.6678, 0, 0, 0, 1, 1,
-0.1535793, -0.7623998, -3.899641, 0, 0, 0, 1, 1,
-0.1511256, 0.1499532, 1.894195, 0, 0, 0, 1, 1,
-0.1488269, -0.3015321, -4.271369, 0, 0, 0, 1, 1,
-0.1476141, 0.1933194, 0.2874947, 1, 1, 1, 1, 1,
-0.1474814, 0.6898, -1.155252, 1, 1, 1, 1, 1,
-0.1454704, 1.445167, -0.5750514, 1, 1, 1, 1, 1,
-0.1389612, 1.326548, -0.5886928, 1, 1, 1, 1, 1,
-0.1348536, 0.2366925, 0.04014746, 1, 1, 1, 1, 1,
-0.1284701, -0.353945, -1.823932, 1, 1, 1, 1, 1,
-0.1283757, -1.055619, -2.448911, 1, 1, 1, 1, 1,
-0.1272189, 0.4152572, -1.224031, 1, 1, 1, 1, 1,
-0.1270091, 1.475114, -0.4114095, 1, 1, 1, 1, 1,
-0.1259933, -1.391401, -3.851969, 1, 1, 1, 1, 1,
-0.1253875, -2.028158, -4.070652, 1, 1, 1, 1, 1,
-0.1249799, -0.2335974, -3.498322, 1, 1, 1, 1, 1,
-0.1245948, -1.298742, -3.535922, 1, 1, 1, 1, 1,
-0.1221696, 0.1507708, 0.315354, 1, 1, 1, 1, 1,
-0.1215078, 1.628382, 0.294031, 1, 1, 1, 1, 1,
-0.1184303, -0.3771242, -2.379466, 0, 0, 1, 1, 1,
-0.1181266, 0.4095882, -1.342834, 1, 0, 0, 1, 1,
-0.1166012, -1.669647, -3.52111, 1, 0, 0, 1, 1,
-0.116571, 0.3096892, 1.238179, 1, 0, 0, 1, 1,
-0.1156229, -1.76562, -2.573943, 1, 0, 0, 1, 1,
-0.1147244, -1.4394, -3.697141, 1, 0, 0, 1, 1,
-0.1119147, -0.923283, -3.105986, 0, 0, 0, 1, 1,
-0.1100463, 0.6366528, -1.293309, 0, 0, 0, 1, 1,
-0.1070698, -0.1025098, -2.337815, 0, 0, 0, 1, 1,
-0.1044321, -0.6984952, -4.727299, 0, 0, 0, 1, 1,
-0.1027484, -1.780702, -4.060615, 0, 0, 0, 1, 1,
-0.09924729, -0.3087508, -2.036023, 0, 0, 0, 1, 1,
-0.09877658, 1.428992, 0.8670698, 0, 0, 0, 1, 1,
-0.09532915, 0.1857323, -1.30842, 1, 1, 1, 1, 1,
-0.09526581, 2.104088, -0.2716357, 1, 1, 1, 1, 1,
-0.09418014, -1.089036, -2.784102, 1, 1, 1, 1, 1,
-0.08467574, -1.653009, -1.391805, 1, 1, 1, 1, 1,
-0.07980464, -1.425809, -3.625699, 1, 1, 1, 1, 1,
-0.07882753, -1.945387, -3.644757, 1, 1, 1, 1, 1,
-0.07827568, -0.3273994, -2.129184, 1, 1, 1, 1, 1,
-0.07684176, 0.6719849, -0.5592762, 1, 1, 1, 1, 1,
-0.0756861, 0.5648956, -0.2102087, 1, 1, 1, 1, 1,
-0.0751621, -0.3018629, -1.370091, 1, 1, 1, 1, 1,
-0.07376399, -0.3046563, -3.312714, 1, 1, 1, 1, 1,
-0.07233445, -1.03041, -4.66805, 1, 1, 1, 1, 1,
-0.07126474, -0.771208, -3.379732, 1, 1, 1, 1, 1,
-0.06783324, -0.1795841, -3.542, 1, 1, 1, 1, 1,
-0.0672169, -1.282364, -4.825038, 1, 1, 1, 1, 1,
-0.06482651, 2.357564, 0.5331842, 0, 0, 1, 1, 1,
-0.06133406, -0.4001664, -2.699399, 1, 0, 0, 1, 1,
-0.06020049, 0.1007304, -1.557446, 1, 0, 0, 1, 1,
-0.05776217, 0.3561118, 0.8342614, 1, 0, 0, 1, 1,
-0.05652817, -0.612623, -2.862324, 1, 0, 0, 1, 1,
-0.05561574, -1.754298, -4.558893, 1, 0, 0, 1, 1,
-0.0541792, 0.1490362, 1.334306, 0, 0, 0, 1, 1,
-0.05123309, -0.254683, -2.701379, 0, 0, 0, 1, 1,
-0.05019147, -0.848992, -3.853095, 0, 0, 0, 1, 1,
-0.04698749, 2.25868, -1.244733, 0, 0, 0, 1, 1,
-0.04233253, 1.715879, -0.2630076, 0, 0, 0, 1, 1,
-0.03863944, -0.4338843, -2.600994, 0, 0, 0, 1, 1,
-0.03598432, -1.031169, -2.555818, 0, 0, 0, 1, 1,
-0.03488185, 0.2553453, 0.2130626, 1, 1, 1, 1, 1,
-0.03145334, -0.3653439, -2.73166, 1, 1, 1, 1, 1,
-0.03138243, 1.946084, -0.2668661, 1, 1, 1, 1, 1,
-0.02980459, -0.6696312, -1.820517, 1, 1, 1, 1, 1,
-0.02770591, -0.471317, -2.700702, 1, 1, 1, 1, 1,
-0.02310548, 1.069927, 0.3214115, 1, 1, 1, 1, 1,
-0.01810927, -0.7218525, -4.484846, 1, 1, 1, 1, 1,
-0.0177901, -0.5031022, -1.977987, 1, 1, 1, 1, 1,
-0.01542637, -1.361178, -3.617639, 1, 1, 1, 1, 1,
-0.01184667, -0.06385862, -3.298331, 1, 1, 1, 1, 1,
-0.01117147, -0.7150539, -3.367195, 1, 1, 1, 1, 1,
-0.0008126993, 0.1799891, 0.6581725, 1, 1, 1, 1, 1,
0.0004897153, -0.3187613, 3.35481, 1, 1, 1, 1, 1,
0.003326485, 1.648972, 1.709013, 1, 1, 1, 1, 1,
0.004800332, 0.8436577, 1.706084, 1, 1, 1, 1, 1,
0.01193562, 0.1928687, 0.6258694, 0, 0, 1, 1, 1,
0.01449812, 1.015467, 0.4618856, 1, 0, 0, 1, 1,
0.01463548, -0.4796077, 2.692219, 1, 0, 0, 1, 1,
0.01946628, -1.008625, 2.170951, 1, 0, 0, 1, 1,
0.01981127, -0.9397766, 3.658556, 1, 0, 0, 1, 1,
0.01995106, 1.478091, 0.7392763, 1, 0, 0, 1, 1,
0.02183428, 1.271744, 0.5491301, 0, 0, 0, 1, 1,
0.02565731, 0.5380058, 0.3693146, 0, 0, 0, 1, 1,
0.03466338, 1.001076, -0.573777, 0, 0, 0, 1, 1,
0.0390592, 1.151754, -0.8537756, 0, 0, 0, 1, 1,
0.03924392, 0.6135904, -1.285272, 0, 0, 0, 1, 1,
0.03942082, 0.646889, -0.163992, 0, 0, 0, 1, 1,
0.03989557, 0.08524131, 2.416677, 0, 0, 0, 1, 1,
0.04231261, 1.747056, -0.3892742, 1, 1, 1, 1, 1,
0.04245004, -0.1616575, 3.991175, 1, 1, 1, 1, 1,
0.04383223, 0.06479226, 0.9064242, 1, 1, 1, 1, 1,
0.04725589, 0.447206, -0.5928297, 1, 1, 1, 1, 1,
0.04875477, 1.217003, 1.732002, 1, 1, 1, 1, 1,
0.05235276, -0.0005933608, 2.659541, 1, 1, 1, 1, 1,
0.05468422, 0.3612072, -0.09922063, 1, 1, 1, 1, 1,
0.05725027, -0.3418441, 4.264013, 1, 1, 1, 1, 1,
0.05844103, 1.292759, 1.138017, 1, 1, 1, 1, 1,
0.06527149, -0.07889562, 4.324182, 1, 1, 1, 1, 1,
0.0670756, -0.6294293, 2.246993, 1, 1, 1, 1, 1,
0.06927931, 0.08332708, 1.320131, 1, 1, 1, 1, 1,
0.07412098, -0.4938895, 3.29637, 1, 1, 1, 1, 1,
0.07595082, 2.132396, 0.2335087, 1, 1, 1, 1, 1,
0.07716287, -1.260705, 2.66967, 1, 1, 1, 1, 1,
0.07734089, 0.7520322, 0.7839785, 0, 0, 1, 1, 1,
0.08177143, -1.456005, 4.851418, 1, 0, 0, 1, 1,
0.0823641, -1.422361, 2.328876, 1, 0, 0, 1, 1,
0.08534976, -1.078816, 3.784964, 1, 0, 0, 1, 1,
0.0865014, 1.152944, 0.9007385, 1, 0, 0, 1, 1,
0.09156352, -0.2654482, 2.830088, 1, 0, 0, 1, 1,
0.09337749, 1.687149, -0.203146, 0, 0, 0, 1, 1,
0.09440611, -1.258633, 5.528917, 0, 0, 0, 1, 1,
0.09678509, -0.3612542, 5.297794, 0, 0, 0, 1, 1,
0.09749596, -0.286856, 1.586638, 0, 0, 0, 1, 1,
0.09810171, 1.050075, -2.140468, 0, 0, 0, 1, 1,
0.09960461, 0.1595211, 1.005616, 0, 0, 0, 1, 1,
0.1016866, -0.1465234, 3.063722, 0, 0, 0, 1, 1,
0.1035019, 0.1255144, 0.6089714, 1, 1, 1, 1, 1,
0.1060244, -0.463569, 4.263989, 1, 1, 1, 1, 1,
0.1066231, -0.2036822, 2.87237, 1, 1, 1, 1, 1,
0.1126865, -0.7180126, 2.841209, 1, 1, 1, 1, 1,
0.1128813, 0.750225, -1.447056, 1, 1, 1, 1, 1,
0.1184716, -0.5612956, 2.400662, 1, 1, 1, 1, 1,
0.1190671, 0.2308937, -0.7154889, 1, 1, 1, 1, 1,
0.1197897, 1.137229, 1.706962, 1, 1, 1, 1, 1,
0.1199993, 0.415183, 0.4327337, 1, 1, 1, 1, 1,
0.1241582, 0.69155, 0.7470823, 1, 1, 1, 1, 1,
0.124378, 0.6814405, 1.339896, 1, 1, 1, 1, 1,
0.1257192, -0.08219635, 2.721424, 1, 1, 1, 1, 1,
0.1399109, 0.4009739, 0.9621333, 1, 1, 1, 1, 1,
0.1434653, -0.0685667, 1.825507, 1, 1, 1, 1, 1,
0.1449219, -1.196867, 2.336395, 1, 1, 1, 1, 1,
0.1493971, 0.6260244, 0.5063264, 0, 0, 1, 1, 1,
0.1529342, 0.352259, 1.227001, 1, 0, 0, 1, 1,
0.156246, 0.2199229, 0.5250481, 1, 0, 0, 1, 1,
0.1564281, 0.6181134, -0.2522468, 1, 0, 0, 1, 1,
0.1579784, 0.4029107, -0.8775783, 1, 0, 0, 1, 1,
0.1594963, 0.2006375, 1.701085, 1, 0, 0, 1, 1,
0.1598744, 1.479551, -0.01801851, 0, 0, 0, 1, 1,
0.1620225, 1.773318, 0.2027977, 0, 0, 0, 1, 1,
0.1624185, 0.1847073, 0.379972, 0, 0, 0, 1, 1,
0.1631408, 1.339399, -0.8919775, 0, 0, 0, 1, 1,
0.1666501, 1.212213, -0.03420964, 0, 0, 0, 1, 1,
0.1686606, 0.3581471, 1.873107, 0, 0, 0, 1, 1,
0.1786281, 0.7039627, 0.5166822, 0, 0, 0, 1, 1,
0.1801596, 1.846459, 0.7511663, 1, 1, 1, 1, 1,
0.180343, 1.182396, -1.433417, 1, 1, 1, 1, 1,
0.1850335, -0.04400127, 2.408832, 1, 1, 1, 1, 1,
0.1888319, 1.751603, 0.5256762, 1, 1, 1, 1, 1,
0.1904471, -0.515689, 2.726365, 1, 1, 1, 1, 1,
0.1910467, -0.110129, 1.88598, 1, 1, 1, 1, 1,
0.1944242, -0.5656405, 1.518475, 1, 1, 1, 1, 1,
0.1964067, -0.168001, 1.231958, 1, 1, 1, 1, 1,
0.1969123, -0.08579896, 2.342335, 1, 1, 1, 1, 1,
0.1976065, -2.446745, 3.551031, 1, 1, 1, 1, 1,
0.1976518, -1.314337, 2.951636, 1, 1, 1, 1, 1,
0.1998054, -0.2620082, 3.706059, 1, 1, 1, 1, 1,
0.1999972, -0.5443321, 1.457184, 1, 1, 1, 1, 1,
0.2007534, -0.9061355, 2.33972, 1, 1, 1, 1, 1,
0.2111915, 0.6698539, 0.1456337, 1, 1, 1, 1, 1,
0.2137687, 0.716116, 0.4413615, 0, 0, 1, 1, 1,
0.2147452, -1.457129, 2.925179, 1, 0, 0, 1, 1,
0.2152549, 0.1183088, 0.8129939, 1, 0, 0, 1, 1,
0.2156977, -1.821252, 2.669292, 1, 0, 0, 1, 1,
0.2175368, 1.574974, 0.6866144, 1, 0, 0, 1, 1,
0.2189004, -0.772808, 3.488761, 1, 0, 0, 1, 1,
0.2209753, -0.3570138, 3.486609, 0, 0, 0, 1, 1,
0.2227173, 1.564553, -0.1360878, 0, 0, 0, 1, 1,
0.2313639, -0.4039483, 2.640085, 0, 0, 0, 1, 1,
0.2316994, -1.275938, 3.379168, 0, 0, 0, 1, 1,
0.2329915, -0.3532028, 2.054571, 0, 0, 0, 1, 1,
0.2351896, -0.5716739, 4.275602, 0, 0, 0, 1, 1,
0.2371706, 1.643139, 0.2738058, 0, 0, 0, 1, 1,
0.2379156, 0.3658157, -0.7285974, 1, 1, 1, 1, 1,
0.2392855, -0.7209421, 4.917284, 1, 1, 1, 1, 1,
0.2406534, -0.9810104, 1.585109, 1, 1, 1, 1, 1,
0.2424719, 0.2662907, 1.474696, 1, 1, 1, 1, 1,
0.2464022, 2.016605, 0.2268961, 1, 1, 1, 1, 1,
0.2464122, -1.255875, 2.663985, 1, 1, 1, 1, 1,
0.2475956, -0.7123216, 3.741575, 1, 1, 1, 1, 1,
0.2486281, 0.5733877, 1.642854, 1, 1, 1, 1, 1,
0.253381, 0.42709, -0.7988388, 1, 1, 1, 1, 1,
0.2556246, -0.03431681, 0.268374, 1, 1, 1, 1, 1,
0.257185, -0.2162112, 2.741685, 1, 1, 1, 1, 1,
0.2609105, -0.04197636, 0.04663954, 1, 1, 1, 1, 1,
0.2649871, -0.370804, 1.975165, 1, 1, 1, 1, 1,
0.270897, -0.4052156, 2.990262, 1, 1, 1, 1, 1,
0.2715324, 0.7079902, -0.4665025, 1, 1, 1, 1, 1,
0.272513, -0.4352546, 2.419243, 0, 0, 1, 1, 1,
0.2743083, 0.765106, 0.7012562, 1, 0, 0, 1, 1,
0.2794797, 1.114094, -0.1221005, 1, 0, 0, 1, 1,
0.2806379, 1.619074, 0.7572309, 1, 0, 0, 1, 1,
0.2825706, 0.7773995, 0.08864759, 1, 0, 0, 1, 1,
0.2841848, -2.218781, 3.666373, 1, 0, 0, 1, 1,
0.2846379, 2.443977, 0.2461612, 0, 0, 0, 1, 1,
0.2866777, 0.09858482, -0.2954167, 0, 0, 0, 1, 1,
0.286909, -1.154648, 2.975718, 0, 0, 0, 1, 1,
0.2912626, -0.710305, 1.12013, 0, 0, 0, 1, 1,
0.2941337, 0.5778051, 0.5893035, 0, 0, 0, 1, 1,
0.2953244, 0.3447369, 0.1518937, 0, 0, 0, 1, 1,
0.2956272, 1.381052, 0.9499111, 0, 0, 0, 1, 1,
0.2967022, -1.559565, 2.167967, 1, 1, 1, 1, 1,
0.3007734, 0.4289991, -0.2155152, 1, 1, 1, 1, 1,
0.3024684, -0.7541828, 1.606105, 1, 1, 1, 1, 1,
0.3036875, 0.6601316, 1.320936, 1, 1, 1, 1, 1,
0.3043987, -1.23734, 2.871066, 1, 1, 1, 1, 1,
0.3070868, -0.7892048, 3.716673, 1, 1, 1, 1, 1,
0.3114011, -0.2621363, 2.08038, 1, 1, 1, 1, 1,
0.3145916, 0.7254845, 0.6066296, 1, 1, 1, 1, 1,
0.3148514, -1.672154, 2.624481, 1, 1, 1, 1, 1,
0.315826, -0.3909126, 2.944659, 1, 1, 1, 1, 1,
0.3163048, -0.3154184, 1.641408, 1, 1, 1, 1, 1,
0.3170505, -0.7727591, 2.469583, 1, 1, 1, 1, 1,
0.3192213, -0.1740161, 0.4348851, 1, 1, 1, 1, 1,
0.3219082, -0.5557455, 2.69787, 1, 1, 1, 1, 1,
0.3235748, 0.1938092, 1.250497, 1, 1, 1, 1, 1,
0.3259881, 1.474007, -0.1648905, 0, 0, 1, 1, 1,
0.326432, -0.3429229, 3.81318, 1, 0, 0, 1, 1,
0.3303079, -1.177758, 3.136037, 1, 0, 0, 1, 1,
0.3325293, -1.398522, 2.083799, 1, 0, 0, 1, 1,
0.33898, 0.7025235, 0.6118756, 1, 0, 0, 1, 1,
0.3405039, 0.2847399, 1.56745, 1, 0, 0, 1, 1,
0.3426772, 0.1876949, 1.742081, 0, 0, 0, 1, 1,
0.3441142, -0.8643206, 2.964243, 0, 0, 0, 1, 1,
0.3460007, 0.4085509, 0.1511635, 0, 0, 0, 1, 1,
0.3505695, -0.9029854, 1.365644, 0, 0, 0, 1, 1,
0.3509193, 2.292174, 2.460695, 0, 0, 0, 1, 1,
0.3519715, -1.871876, 3.994009, 0, 0, 0, 1, 1,
0.3521648, -0.8527278, 4.720428, 0, 0, 0, 1, 1,
0.3564085, 0.8779039, -0.1945289, 1, 1, 1, 1, 1,
0.3577378, 1.473441, 0.2002091, 1, 1, 1, 1, 1,
0.3577417, -0.2474597, 2.275405, 1, 1, 1, 1, 1,
0.3586659, 0.7400911, -0.2554944, 1, 1, 1, 1, 1,
0.3670519, 2.248789, 2.254727, 1, 1, 1, 1, 1,
0.3683907, 0.1741952, 0.2357237, 1, 1, 1, 1, 1,
0.3695204, 0.7861291, -0.4227335, 1, 1, 1, 1, 1,
0.3717444, -1.022093, 2.288381, 1, 1, 1, 1, 1,
0.371977, -0.8345106, 3.340826, 1, 1, 1, 1, 1,
0.3721243, 0.06055843, 2.196391, 1, 1, 1, 1, 1,
0.3767715, -0.3097951, 1.921791, 1, 1, 1, 1, 1,
0.3774007, -0.1866145, 1.581147, 1, 1, 1, 1, 1,
0.3776079, 0.8367808, 0.2699372, 1, 1, 1, 1, 1,
0.3786291, -2.809035, 2.475638, 1, 1, 1, 1, 1,
0.379065, 1.229884, 1.359461, 1, 1, 1, 1, 1,
0.3794648, 0.4022536, 0.2123255, 0, 0, 1, 1, 1,
0.3802876, -1.041152, 2.235617, 1, 0, 0, 1, 1,
0.3883769, -0.4016339, 3.572172, 1, 0, 0, 1, 1,
0.3904933, 0.2966329, 1.490886, 1, 0, 0, 1, 1,
0.390518, 0.1117778, 1.21976, 1, 0, 0, 1, 1,
0.3913495, 0.06530021, 2.043628, 1, 0, 0, 1, 1,
0.3925883, -0.5876225, 2.728427, 0, 0, 0, 1, 1,
0.3943636, 0.701165, -0.1772971, 0, 0, 0, 1, 1,
0.3946176, 0.9882559, 2.15788, 0, 0, 0, 1, 1,
0.3959372, -1.060335, 1.416795, 0, 0, 0, 1, 1,
0.4025045, -0.1615984, 2.46972, 0, 0, 0, 1, 1,
0.4091048, 1.742567, 0.01622144, 0, 0, 0, 1, 1,
0.4096934, -2.240303, 2.622599, 0, 0, 0, 1, 1,
0.4111944, 0.03071549, 0.4319375, 1, 1, 1, 1, 1,
0.4122003, 1.182753, 1.017945, 1, 1, 1, 1, 1,
0.4135649, 0.2785302, 2.756716, 1, 1, 1, 1, 1,
0.417226, 0.3556808, 0.8237141, 1, 1, 1, 1, 1,
0.418299, -0.05440802, 3.778695, 1, 1, 1, 1, 1,
0.4191499, 0.4638838, 0.218031, 1, 1, 1, 1, 1,
0.4214208, 1.716536, -1.49055, 1, 1, 1, 1, 1,
0.4222332, 0.1606089, 1.424795, 1, 1, 1, 1, 1,
0.4224966, 0.2381802, 0.0558878, 1, 1, 1, 1, 1,
0.425798, -0.1689898, 1.379275, 1, 1, 1, 1, 1,
0.4275699, -0.2791536, 1.451961, 1, 1, 1, 1, 1,
0.4305247, -1.316881, 3.229377, 1, 1, 1, 1, 1,
0.431832, 1.498043, 0.3399444, 1, 1, 1, 1, 1,
0.4351163, 0.6936352, -0.8120214, 1, 1, 1, 1, 1,
0.4362141, -0.2781485, 2.459167, 1, 1, 1, 1, 1,
0.4400399, 0.3088328, -0.4623064, 0, 0, 1, 1, 1,
0.4402574, -0.05744998, 1.699397, 1, 0, 0, 1, 1,
0.4410852, 0.1074867, -0.4126315, 1, 0, 0, 1, 1,
0.4421235, 0.8282435, 0.8407251, 1, 0, 0, 1, 1,
0.444595, -1.905732, 1.175774, 1, 0, 0, 1, 1,
0.4463589, -0.6765825, 3.204232, 1, 0, 0, 1, 1,
0.4466844, 1.093017, 0.5399753, 0, 0, 0, 1, 1,
0.4494824, -0.5752871, 2.203515, 0, 0, 0, 1, 1,
0.4533657, 0.1109721, 1.04344, 0, 0, 0, 1, 1,
0.4545352, -0.4361875, 2.089846, 0, 0, 0, 1, 1,
0.459956, 0.9882363, -1.233846, 0, 0, 0, 1, 1,
0.462859, 0.4377644, 0.05039627, 0, 0, 0, 1, 1,
0.4641211, -0.7996769, 3.3265, 0, 0, 0, 1, 1,
0.4660568, 1.202863, 0.6255325, 1, 1, 1, 1, 1,
0.4686749, -1.162881, 3.640933, 1, 1, 1, 1, 1,
0.4769289, 1.833524, 0.4203739, 1, 1, 1, 1, 1,
0.4774438, 0.7989653, -2.416461, 1, 1, 1, 1, 1,
0.4794645, -0.53842, 2.673244, 1, 1, 1, 1, 1,
0.4800904, 0.8274269, 0.0650417, 1, 1, 1, 1, 1,
0.4810922, -1.29092, 2.818629, 1, 1, 1, 1, 1,
0.4852036, -2.036396, 3.761492, 1, 1, 1, 1, 1,
0.4869285, -0.3244323, 2.278529, 1, 1, 1, 1, 1,
0.4875256, -1.372414, 2.045005, 1, 1, 1, 1, 1,
0.4883301, -0.7891356, 3.167, 1, 1, 1, 1, 1,
0.4964234, -0.2650582, 2.232234, 1, 1, 1, 1, 1,
0.5024245, 0.1275776, 2.343378, 1, 1, 1, 1, 1,
0.5024655, 0.7252936, 0.3733757, 1, 1, 1, 1, 1,
0.5087048, 1.138841, 1.812431, 1, 1, 1, 1, 1,
0.5089669, 2.293541, -0.2473533, 0, 0, 1, 1, 1,
0.5092846, 0.6061596, 0.1499677, 1, 0, 0, 1, 1,
0.5138859, -1.687227, 3.877931, 1, 0, 0, 1, 1,
0.5178826, 0.1035616, 1.079395, 1, 0, 0, 1, 1,
0.5195197, 0.4619075, 0.7712469, 1, 0, 0, 1, 1,
0.5271352, 0.3695825, 1.099548, 1, 0, 0, 1, 1,
0.5295961, -0.1942483, 3.147488, 0, 0, 0, 1, 1,
0.5318658, 0.415304, 1.924076, 0, 0, 0, 1, 1,
0.5326257, -0.7613626, 2.115722, 0, 0, 0, 1, 1,
0.5336739, 1.034133, 0.5922039, 0, 0, 0, 1, 1,
0.5353853, -0.7905712, 2.372456, 0, 0, 0, 1, 1,
0.5369841, 1.294086, 0.7580112, 0, 0, 0, 1, 1,
0.53707, -0.2137622, 2.485161, 0, 0, 0, 1, 1,
0.5407459, -0.6012377, 3.400358, 1, 1, 1, 1, 1,
0.5421687, 2.411157, 0.754303, 1, 1, 1, 1, 1,
0.542436, 1.327713, -1.118879, 1, 1, 1, 1, 1,
0.5442785, 0.2878766, 0.8859197, 1, 1, 1, 1, 1,
0.5451195, -0.3987893, 1.919509, 1, 1, 1, 1, 1,
0.5477711, -0.4755586, 2.696018, 1, 1, 1, 1, 1,
0.5492314, 1.031669, -0.08337258, 1, 1, 1, 1, 1,
0.5583445, 0.5107756, 0.07299159, 1, 1, 1, 1, 1,
0.5588247, 0.4715412, 1.375471, 1, 1, 1, 1, 1,
0.559822, -0.3007228, 2.690692, 1, 1, 1, 1, 1,
0.5605925, 0.4530187, 0.01758796, 1, 1, 1, 1, 1,
0.5613394, 0.7655395, 0.5734599, 1, 1, 1, 1, 1,
0.5625798, -2.200837, 3.173153, 1, 1, 1, 1, 1,
0.5674406, 0.4515646, -3.424438, 1, 1, 1, 1, 1,
0.5706721, 0.502151, 0.4022959, 1, 1, 1, 1, 1,
0.5728899, -0.4903112, 1.903747, 0, 0, 1, 1, 1,
0.5749804, 1.622835, 0.5516422, 1, 0, 0, 1, 1,
0.5765468, 1.872352, -0.1111798, 1, 0, 0, 1, 1,
0.5772235, -1.413658, 3.365961, 1, 0, 0, 1, 1,
0.5776371, -1.556347, 3.183625, 1, 0, 0, 1, 1,
0.5788668, 0.7220857, 3.867706, 1, 0, 0, 1, 1,
0.5804913, 1.202673, 1.517622, 0, 0, 0, 1, 1,
0.5898816, -1.501535, 3.180857, 0, 0, 0, 1, 1,
0.5918483, -0.03831997, 0.4986637, 0, 0, 0, 1, 1,
0.5947152, -0.024691, 1.228539, 0, 0, 0, 1, 1,
0.598435, -0.7397646, 1.422536, 0, 0, 0, 1, 1,
0.599715, 1.021421, 0.3463115, 0, 0, 0, 1, 1,
0.6069231, 0.4633615, 0.6382171, 0, 0, 0, 1, 1,
0.6099234, 0.4957559, 1.888904, 1, 1, 1, 1, 1,
0.6150589, -0.4632069, 2.270235, 1, 1, 1, 1, 1,
0.6198585, -0.4608999, 3.438716, 1, 1, 1, 1, 1,
0.6219683, -0.6527402, 3.027567, 1, 1, 1, 1, 1,
0.6229704, -0.8570717, 2.581506, 1, 1, 1, 1, 1,
0.6272555, 0.2369152, 0.626231, 1, 1, 1, 1, 1,
0.6296008, -0.5125016, 2.476815, 1, 1, 1, 1, 1,
0.6299925, 0.0003549475, 2.680693, 1, 1, 1, 1, 1,
0.6314889, 0.4188401, -0.03761657, 1, 1, 1, 1, 1,
0.642853, 0.6861992, 0.199918, 1, 1, 1, 1, 1,
0.6536392, 0.7041701, -1.233155, 1, 1, 1, 1, 1,
0.6566589, 0.1747576, 1.044492, 1, 1, 1, 1, 1,
0.6631657, -0.3568299, 1.739755, 1, 1, 1, 1, 1,
0.6637726, 1.120905, -0.733135, 1, 1, 1, 1, 1,
0.6653859, 1.08325, 0.4180464, 1, 1, 1, 1, 1,
0.6686416, 0.6547052, -0.5961241, 0, 0, 1, 1, 1,
0.6723467, 0.4152269, 0.9973373, 1, 0, 0, 1, 1,
0.672608, -0.005196581, 1.950028, 1, 0, 0, 1, 1,
0.6801598, 0.3409465, 1.148462, 1, 0, 0, 1, 1,
0.6966703, 0.3658789, 1.76943, 1, 0, 0, 1, 1,
0.7065634, 1.753849, -0.2689946, 1, 0, 0, 1, 1,
0.7086487, -1.749279, 1.445137, 0, 0, 0, 1, 1,
0.7097251, 0.324976, 1.050628, 0, 0, 0, 1, 1,
0.7128643, -0.1530344, 2.445165, 0, 0, 0, 1, 1,
0.7133545, 0.2208307, 2.14347, 0, 0, 0, 1, 1,
0.7190737, -1.513559, 0.9597785, 0, 0, 0, 1, 1,
0.7212684, -1.513376, 1.160235, 0, 0, 0, 1, 1,
0.7229868, -2.00145, 3.722484, 0, 0, 0, 1, 1,
0.7237249, -1.777794, 3.692807, 1, 1, 1, 1, 1,
0.7243729, 0.8861918, -0.1221335, 1, 1, 1, 1, 1,
0.7272354, -1.634509, 2.620229, 1, 1, 1, 1, 1,
0.7356913, -1.710003, 1.633014, 1, 1, 1, 1, 1,
0.7408759, -0.1417294, 1.005836, 1, 1, 1, 1, 1,
0.7449486, -0.8713095, 1.727244, 1, 1, 1, 1, 1,
0.7498826, -0.2339511, 2.750459, 1, 1, 1, 1, 1,
0.7512178, 1.603837, 1.115763, 1, 1, 1, 1, 1,
0.7512363, 0.04443688, 1.102117, 1, 1, 1, 1, 1,
0.7522903, 0.789125, -0.2298628, 1, 1, 1, 1, 1,
0.7628062, 0.2337074, 0.9846514, 1, 1, 1, 1, 1,
0.7652976, 1.119298, 0.1872458, 1, 1, 1, 1, 1,
0.7696137, 0.3060293, 1.934213, 1, 1, 1, 1, 1,
0.7703514, -0.6098892, 1.159582, 1, 1, 1, 1, 1,
0.7723411, 0.4897382, 2.255497, 1, 1, 1, 1, 1,
0.7811755, 0.2697357, -0.6648859, 0, 0, 1, 1, 1,
0.7846435, 1.152714, 1.435678, 1, 0, 0, 1, 1,
0.7861195, -0.6254633, 1.130064, 1, 0, 0, 1, 1,
0.789214, -1.648603, 2.843241, 1, 0, 0, 1, 1,
0.7915908, -0.5703801, 2.255727, 1, 0, 0, 1, 1,
0.795573, -0.4316538, 0.9458863, 1, 0, 0, 1, 1,
0.7993303, 0.1343784, 0.5135207, 0, 0, 0, 1, 1,
0.8020733, -0.1032596, 0.2047634, 0, 0, 0, 1, 1,
0.8052936, 0.5388775, 0.4444095, 0, 0, 0, 1, 1,
0.8086477, -0.08049348, 1.239624, 0, 0, 0, 1, 1,
0.8125058, -0.1152872, 1.107693, 0, 0, 0, 1, 1,
0.8146572, -0.2662812, 1.022975, 0, 0, 0, 1, 1,
0.8163446, -1.521223, 1.555249, 0, 0, 0, 1, 1,
0.8169191, 0.06312726, 1.102742, 1, 1, 1, 1, 1,
0.8185271, 0.3075527, 0.2586096, 1, 1, 1, 1, 1,
0.8259164, -0.3093029, 3.713349, 1, 1, 1, 1, 1,
0.8260152, -0.04094806, 2.498793, 1, 1, 1, 1, 1,
0.8297501, 1.333305, 1.513321, 1, 1, 1, 1, 1,
0.8302751, 0.5281094, 1.371383, 1, 1, 1, 1, 1,
0.8312412, -1.821298, 2.639647, 1, 1, 1, 1, 1,
0.8321341, -0.9530017, 1.969025, 1, 1, 1, 1, 1,
0.8329837, -1.250305, 2.421192, 1, 1, 1, 1, 1,
0.8330345, -0.4690088, -0.2410159, 1, 1, 1, 1, 1,
0.8345069, -0.9441062, 1.46927, 1, 1, 1, 1, 1,
0.8410254, 1.638005, 1.34896, 1, 1, 1, 1, 1,
0.8437037, -0.09694215, 1.650466, 1, 1, 1, 1, 1,
0.844507, 0.7858369, -0.1391478, 1, 1, 1, 1, 1,
0.851386, -0.8262119, 3.938046, 1, 1, 1, 1, 1,
0.8513963, 1.264071, -0.2428629, 0, 0, 1, 1, 1,
0.8528388, -2.188869, 1.614874, 1, 0, 0, 1, 1,
0.8541805, 1.715915, -1.025801, 1, 0, 0, 1, 1,
0.860183, 0.1778696, 0.6539165, 1, 0, 0, 1, 1,
0.8617858, -1.56733, 1.551562, 1, 0, 0, 1, 1,
0.863838, 0.1128841, 1.166698, 1, 0, 0, 1, 1,
0.8650956, 0.6841931, 0.1887331, 0, 0, 0, 1, 1,
0.8671992, 1.311785, 1.431363, 0, 0, 0, 1, 1,
0.8749266, -1.479257, 1.967963, 0, 0, 0, 1, 1,
0.875049, -0.6921693, 2.940344, 0, 0, 0, 1, 1,
0.8752253, 2.186036, -1.554536, 0, 0, 0, 1, 1,
0.8788188, 1.781531, 0.1028572, 0, 0, 0, 1, 1,
0.8805873, 0.1262223, 0.1249935, 0, 0, 0, 1, 1,
0.8812703, -0.157327, 1.992932, 1, 1, 1, 1, 1,
0.8877602, 1.022939, 0.2806811, 1, 1, 1, 1, 1,
0.8906432, -1.122446, 1.567961, 1, 1, 1, 1, 1,
0.9004144, 1.210345, 0.7582536, 1, 1, 1, 1, 1,
0.9057912, 1.320771, 1.760368, 1, 1, 1, 1, 1,
0.9085302, 0.3400586, 1.96231, 1, 1, 1, 1, 1,
0.9085543, 1.096188, 1.103785, 1, 1, 1, 1, 1,
0.9101326, -0.6002561, 4.754292, 1, 1, 1, 1, 1,
0.911545, -1.210888, 3.747598, 1, 1, 1, 1, 1,
0.916326, 0.3478923, 0.2562297, 1, 1, 1, 1, 1,
0.9166699, 0.05413043, 0.8312315, 1, 1, 1, 1, 1,
0.917376, -2.106273, 2.836164, 1, 1, 1, 1, 1,
0.9212422, 1.991046, 1.710114, 1, 1, 1, 1, 1,
0.9243959, 0.850843, 0.5310782, 1, 1, 1, 1, 1,
0.9306615, 1.517549, 1.892799, 1, 1, 1, 1, 1,
0.9313448, 1.10885, 0.8707867, 0, 0, 1, 1, 1,
0.9320282, -0.2999502, 1.191095, 1, 0, 0, 1, 1,
0.9356552, 1.060326, 0.3255539, 1, 0, 0, 1, 1,
0.9372162, 1.593116, 0.3662776, 1, 0, 0, 1, 1,
0.9448592, 0.8367304, 0.3479519, 1, 0, 0, 1, 1,
0.9452078, 0.06596442, 2.253011, 1, 0, 0, 1, 1,
0.9489547, 1.080069, 1.868208, 0, 0, 0, 1, 1,
0.9518231, 0.002001681, 1.715626, 0, 0, 0, 1, 1,
0.9632142, 0.3758011, 1.378999, 0, 0, 0, 1, 1,
0.9700996, 0.895829, 0.7833068, 0, 0, 0, 1, 1,
0.9706894, -1.484092, 4.239657, 0, 0, 0, 1, 1,
0.9721045, 0.4856397, 1.827659, 0, 0, 0, 1, 1,
0.9751245, 0.4728742, 1.241933, 0, 0, 0, 1, 1,
0.976712, -0.9541521, 3.511395, 1, 1, 1, 1, 1,
0.9835672, -0.5643589, 2.694976, 1, 1, 1, 1, 1,
0.9879556, -0.09308726, 1.577436, 1, 1, 1, 1, 1,
0.9909542, 0.2130582, 0.59541, 1, 1, 1, 1, 1,
0.9985345, -0.834544, 4.252632, 1, 1, 1, 1, 1,
0.999272, -0.004074295, 1.298755, 1, 1, 1, 1, 1,
0.999926, -0.4240848, 1.629431, 1, 1, 1, 1, 1,
1.000839, -0.9285765, 0.9784492, 1, 1, 1, 1, 1,
1.002064, -0.7548304, 2.059792, 1, 1, 1, 1, 1,
1.015016, 2.648785, -0.5248642, 1, 1, 1, 1, 1,
1.015733, -0.9386507, 2.373591, 1, 1, 1, 1, 1,
1.024306, -0.1594585, 1.662627, 1, 1, 1, 1, 1,
1.028222, 1.965503, 2.212554, 1, 1, 1, 1, 1,
1.030025, 1.153984, 0.6818455, 1, 1, 1, 1, 1,
1.030229, 1.36954, 1.541362, 1, 1, 1, 1, 1,
1.032634, -1.35609, 2.552608, 0, 0, 1, 1, 1,
1.032967, -0.6573523, 1.713322, 1, 0, 0, 1, 1,
1.032998, 0.3748288, 0.4506557, 1, 0, 0, 1, 1,
1.042173, 0.6140487, 0.2585727, 1, 0, 0, 1, 1,
1.043637, 0.1052751, 0.6746043, 1, 0, 0, 1, 1,
1.044689, 0.4063945, 1.527266, 1, 0, 0, 1, 1,
1.053575, -2.647504, 1.4992, 0, 0, 0, 1, 1,
1.05618, -2.134571, 2.734619, 0, 0, 0, 1, 1,
1.063139, 0.6064599, 1.43286, 0, 0, 0, 1, 1,
1.063339, 0.007413832, 1.303865, 0, 0, 0, 1, 1,
1.064891, -0.7810502, 2.832165, 0, 0, 0, 1, 1,
1.067143, -0.7322236, 3.12292, 0, 0, 0, 1, 1,
1.076619, -0.4451085, 1.740751, 0, 0, 0, 1, 1,
1.084628, 2.554449, 0.4833036, 1, 1, 1, 1, 1,
1.093499, 0.5917246, 1.365906, 1, 1, 1, 1, 1,
1.098267, 0.1927096, 1.041062, 1, 1, 1, 1, 1,
1.102187, -0.572795, 3.173701, 1, 1, 1, 1, 1,
1.105762, -0.6588508, 2.24674, 1, 1, 1, 1, 1,
1.112588, 0.04929649, 0.9524084, 1, 1, 1, 1, 1,
1.116177, -0.001443666, 2.414594, 1, 1, 1, 1, 1,
1.119845, -0.9130085, 2.447853, 1, 1, 1, 1, 1,
1.12351, 0.8026546, 1.725016, 1, 1, 1, 1, 1,
1.137052, 0.4770582, 1.871537, 1, 1, 1, 1, 1,
1.139122, 0.5888668, 1.040635, 1, 1, 1, 1, 1,
1.14476, -1.087073, 3.025743, 1, 1, 1, 1, 1,
1.144766, -1.252334, 1.436724, 1, 1, 1, 1, 1,
1.145955, -0.5879244, 1.951783, 1, 1, 1, 1, 1,
1.146662, -1.526496, 3.787482, 1, 1, 1, 1, 1,
1.149993, -1.124629, 2.158046, 0, 0, 1, 1, 1,
1.157557, -0.2761841, 3.004895, 1, 0, 0, 1, 1,
1.159934, -0.6306374, 2.426787, 1, 0, 0, 1, 1,
1.160821, -0.1133275, 1.297302, 1, 0, 0, 1, 1,
1.164759, 0.7953634, -0.0940937, 1, 0, 0, 1, 1,
1.171476, 0.8322762, 0.6863335, 1, 0, 0, 1, 1,
1.179067, 0.907195, -1.218236, 0, 0, 0, 1, 1,
1.179432, 1.608871, 0.904572, 0, 0, 0, 1, 1,
1.183683, -0.9580486, 2.118276, 0, 0, 0, 1, 1,
1.190131, 0.5302458, 1.094291, 0, 0, 0, 1, 1,
1.201144, -1.46478, 3.265436, 0, 0, 0, 1, 1,
1.214714, 0.3979409, 1.674776, 0, 0, 0, 1, 1,
1.229079, -0.05227366, 2.115074, 0, 0, 0, 1, 1,
1.232283, -0.1037344, 1.025314, 1, 1, 1, 1, 1,
1.234808, 0.07129245, 2.11495, 1, 1, 1, 1, 1,
1.236076, -0.758674, 1.498058, 1, 1, 1, 1, 1,
1.238063, 0.6650332, 1.237867, 1, 1, 1, 1, 1,
1.248529, -1.606926, 2.537592, 1, 1, 1, 1, 1,
1.253138, 0.01308972, 0.9377599, 1, 1, 1, 1, 1,
1.257504, -1.449356, 3.610757, 1, 1, 1, 1, 1,
1.259984, -1.046318, 3.967629, 1, 1, 1, 1, 1,
1.261478, 2.377887, 2.104214, 1, 1, 1, 1, 1,
1.293642, 1.07101, 0.6332145, 1, 1, 1, 1, 1,
1.293908, -1.181185, 1.844252, 1, 1, 1, 1, 1,
1.299477, 1.164379, 1.09344, 1, 1, 1, 1, 1,
1.311156, -1.254888, 2.885512, 1, 1, 1, 1, 1,
1.31913, 1.073306, 0.6816748, 1, 1, 1, 1, 1,
1.322919, 1.017259, 0.9454926, 1, 1, 1, 1, 1,
1.32301, 0.3774524, 0.1189522, 0, 0, 1, 1, 1,
1.327116, -0.2290902, 1.481483, 1, 0, 0, 1, 1,
1.330575, 0.173639, -1.582422, 1, 0, 0, 1, 1,
1.352332, -0.6516681, 1.872486, 1, 0, 0, 1, 1,
1.381688, 0.4306, 0.7308002, 1, 0, 0, 1, 1,
1.382924, -2.629662, 2.919349, 1, 0, 0, 1, 1,
1.386476, 0.2812225, 2.060521, 0, 0, 0, 1, 1,
1.38915, -0.2610364, 2.046603, 0, 0, 0, 1, 1,
1.399551, 0.5107912, 0.9259506, 0, 0, 0, 1, 1,
1.403622, -1.558166, 3.210663, 0, 0, 0, 1, 1,
1.414148, -0.4382732, 1.217738, 0, 0, 0, 1, 1,
1.414389, -0.120966, 1.174741, 0, 0, 0, 1, 1,
1.416043, 0.2273234, 0.4360776, 0, 0, 0, 1, 1,
1.4192, -0.5362596, 1.535475, 1, 1, 1, 1, 1,
1.420722, -0.3260014, 0.6028404, 1, 1, 1, 1, 1,
1.422336, 0.1857407, 2.053509, 1, 1, 1, 1, 1,
1.448567, -1.199472, 3.059799, 1, 1, 1, 1, 1,
1.454715, 0.6810571, 1.320197, 1, 1, 1, 1, 1,
1.456117, 0.3736031, 0.3855303, 1, 1, 1, 1, 1,
1.466906, -0.3852643, 2.000702, 1, 1, 1, 1, 1,
1.467036, 1.337856, -0.4346683, 1, 1, 1, 1, 1,
1.482921, -0.4723555, 1.372611, 1, 1, 1, 1, 1,
1.51177, -0.4924934, 1.424368, 1, 1, 1, 1, 1,
1.511964, 1.674664, 0.3004229, 1, 1, 1, 1, 1,
1.526931, 1.285968, 2.296301, 1, 1, 1, 1, 1,
1.52992, 2.359026, -1.073995, 1, 1, 1, 1, 1,
1.53074, 0.393474, 1.709599, 1, 1, 1, 1, 1,
1.546842, -0.7702972, 3.080227, 1, 1, 1, 1, 1,
1.576208, -1.663918, 2.81008, 0, 0, 1, 1, 1,
1.578586, -0.4890179, 0.3677734, 1, 0, 0, 1, 1,
1.579139, 1.46875, -0.8744791, 1, 0, 0, 1, 1,
1.5905, -0.6157256, 1.788495, 1, 0, 0, 1, 1,
1.602237, -2.673211, 2.159951, 1, 0, 0, 1, 1,
1.623734, 1.023034, 0.6203616, 1, 0, 0, 1, 1,
1.671115, 0.3680998, 1.017156, 0, 0, 0, 1, 1,
1.693212, -0.5292944, 2.235015, 0, 0, 0, 1, 1,
1.71403, 0.3450042, 3.065161, 0, 0, 0, 1, 1,
1.722415, -1.268026, 3.518108, 0, 0, 0, 1, 1,
1.727809, 0.3996687, -0.5295821, 0, 0, 0, 1, 1,
1.730674, 1.306257, 1.327728, 0, 0, 0, 1, 1,
1.75683, -0.7211251, 2.207451, 0, 0, 0, 1, 1,
1.769712, 1.585513, 1.350183, 1, 1, 1, 1, 1,
1.789394, -0.6176698, 1.404099, 1, 1, 1, 1, 1,
1.795767, -0.05157524, 0.9999791, 1, 1, 1, 1, 1,
1.79707, 0.03543165, 1.67487, 1, 1, 1, 1, 1,
1.809666, 1.335259, 2.280815, 1, 1, 1, 1, 1,
1.81657, -0.5010662, 1.052772, 1, 1, 1, 1, 1,
1.826613, 1.339355, 0.7957975, 1, 1, 1, 1, 1,
1.82709, -1.582142, 3.309902, 1, 1, 1, 1, 1,
1.829732, -0.4462423, 3.189659, 1, 1, 1, 1, 1,
1.835534, 0.3250753, 0.1292402, 1, 1, 1, 1, 1,
1.856049, -0.08834861, 3.102107, 1, 1, 1, 1, 1,
1.880175, -0.5348282, 1.771977, 1, 1, 1, 1, 1,
1.90452, -0.1809287, 1.966026, 1, 1, 1, 1, 1,
1.93482, 1.434169, 1.276421, 1, 1, 1, 1, 1,
1.955121, -0.7719269, 1.987093, 1, 1, 1, 1, 1,
2.006709, 0.06183314, 1.734762, 0, 0, 1, 1, 1,
2.024983, 0.22957, 0.2574394, 1, 0, 0, 1, 1,
2.032091, 0.8564234, 2.487951, 1, 0, 0, 1, 1,
2.053793, 0.9510909, 0.5008198, 1, 0, 0, 1, 1,
2.060111, -1.850699, 1.895554, 1, 0, 0, 1, 1,
2.062137, 1.142976, 0.6719843, 1, 0, 0, 1, 1,
2.088856, -0.4008956, 1.589941, 0, 0, 0, 1, 1,
2.190524, 0.5724687, 0.7699779, 0, 0, 0, 1, 1,
2.204472, 0.7590441, 0.8899611, 0, 0, 0, 1, 1,
2.313779, -0.7331393, 2.079831, 0, 0, 0, 1, 1,
2.359745, 0.8924394, 2.288233, 0, 0, 0, 1, 1,
2.362052, -0.6774531, 2.518276, 0, 0, 0, 1, 1,
2.378585, -2.229252, 1.267683, 0, 0, 0, 1, 1,
2.414296, 0.3844386, 2.596103, 1, 1, 1, 1, 1,
2.45516, 2.407116, -1.466372, 1, 1, 1, 1, 1,
2.552112, 0.06562448, 0.8411115, 1, 1, 1, 1, 1,
2.575188, -0.6768953, 0.471574, 1, 1, 1, 1, 1,
3.130235, 0.7125761, 1.407136, 1, 1, 1, 1, 1,
3.21249, 0.9304009, 2.154577, 1, 1, 1, 1, 1,
3.855625, -0.7883872, 0.7245446, 1, 1, 1, 1, 1
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
var radius = 9.471612;
var distance = 33.26863;
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
mvMatrix.translate( -0.5373054, -0.01067305, -0.2054987 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.26863);
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