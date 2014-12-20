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
-2.494465, -0.7812589, -3.678838, 1, 0, 0, 1,
-2.42837, 1.354051, -0.261334, 1, 0.007843138, 0, 1,
-2.399954, -0.9849151, -1.356239, 1, 0.01176471, 0, 1,
-2.215083, 0.2200558, -1.844714, 1, 0.01960784, 0, 1,
-2.21471, 1.678264, -1.661675, 1, 0.02352941, 0, 1,
-2.211575, 0.4028407, -2.068454, 1, 0.03137255, 0, 1,
-2.125809, 0.5824383, -1.088812, 1, 0.03529412, 0, 1,
-2.109422, -1.712855, -1.163796, 1, 0.04313726, 0, 1,
-2.073022, 0.03107882, -1.066584, 1, 0.04705882, 0, 1,
-2.019688, 0.1972768, -1.043452, 1, 0.05490196, 0, 1,
-2.01166, -0.9767376, -3.250031, 1, 0.05882353, 0, 1,
-2.0087, 0.5794224, -0.4218268, 1, 0.06666667, 0, 1,
-1.989554, 0.6442131, 0.2678858, 1, 0.07058824, 0, 1,
-1.985802, 0.8389388, -1.26852, 1, 0.07843138, 0, 1,
-1.977459, -0.01086567, 0.01448776, 1, 0.08235294, 0, 1,
-1.96113, 0.9355203, -2.123911, 1, 0.09019608, 0, 1,
-1.924888, 0.7232387, -0.4691879, 1, 0.09411765, 0, 1,
-1.921268, -0.3954083, -1.713801, 1, 0.1019608, 0, 1,
-1.897418, -1.017073, -1.429952, 1, 0.1098039, 0, 1,
-1.873539, -1.911753, -4.13667, 1, 0.1137255, 0, 1,
-1.849329, -0.8253465, -0.9732947, 1, 0.1215686, 0, 1,
-1.845743, 0.1292196, -1.635229, 1, 0.1254902, 0, 1,
-1.84251, -0.8879891, -1.453073, 1, 0.1333333, 0, 1,
-1.828022, -0.3152657, -1.67456, 1, 0.1372549, 0, 1,
-1.827679, -0.5471382, -3.145641, 1, 0.145098, 0, 1,
-1.823096, -0.5216647, -0.8021749, 1, 0.1490196, 0, 1,
-1.819731, -0.4316822, -2.711534, 1, 0.1568628, 0, 1,
-1.818103, 0.4272666, -1.078983, 1, 0.1607843, 0, 1,
-1.814003, 0.1168684, -1.115859, 1, 0.1686275, 0, 1,
-1.810096, -0.2785011, -3.094461, 1, 0.172549, 0, 1,
-1.806813, -0.1300963, -0.2978968, 1, 0.1803922, 0, 1,
-1.80233, -0.6295201, -2.723629, 1, 0.1843137, 0, 1,
-1.79916, 1.623079, -0.8170565, 1, 0.1921569, 0, 1,
-1.777059, -0.8361977, -3.895668, 1, 0.1960784, 0, 1,
-1.768141, -0.1390434, -1.516565, 1, 0.2039216, 0, 1,
-1.726563, 0.9557461, -1.973619, 1, 0.2117647, 0, 1,
-1.72191, -0.7797601, -1.057167, 1, 0.2156863, 0, 1,
-1.720195, 1.141568, -0.8989175, 1, 0.2235294, 0, 1,
-1.710061, -2.478711, -3.238418, 1, 0.227451, 0, 1,
-1.688911, 0.1203859, -2.65251, 1, 0.2352941, 0, 1,
-1.676115, -0.5637222, 0.09846208, 1, 0.2392157, 0, 1,
-1.657144, -0.4815105, -0.6803881, 1, 0.2470588, 0, 1,
-1.654034, -0.3558851, -1.999417, 1, 0.2509804, 0, 1,
-1.647834, 0.6968006, 0.9595501, 1, 0.2588235, 0, 1,
-1.637096, -1.277049, -3.531531, 1, 0.2627451, 0, 1,
-1.621199, 0.8421624, -1.108261, 1, 0.2705882, 0, 1,
-1.618306, -1.187848, -2.200453, 1, 0.2745098, 0, 1,
-1.594438, 1.934292, 1.433981, 1, 0.282353, 0, 1,
-1.583802, -0.7049273, -1.750445, 1, 0.2862745, 0, 1,
-1.570836, -1.238945, -1.390402, 1, 0.2941177, 0, 1,
-1.565175, -0.128703, -2.002099, 1, 0.3019608, 0, 1,
-1.562219, -0.1731507, -1.497543, 1, 0.3058824, 0, 1,
-1.560695, 0.1915604, -1.910705, 1, 0.3137255, 0, 1,
-1.558399, 0.4670067, -0.910301, 1, 0.3176471, 0, 1,
-1.531408, 1.016881, 0.1973946, 1, 0.3254902, 0, 1,
-1.524701, -0.4405128, -1.887712, 1, 0.3294118, 0, 1,
-1.518516, 2.096527, 0.5064929, 1, 0.3372549, 0, 1,
-1.517755, 0.9801157, -2.471049, 1, 0.3411765, 0, 1,
-1.513539, -0.5410939, -2.206928, 1, 0.3490196, 0, 1,
-1.507813, -0.008047361, -2.502685, 1, 0.3529412, 0, 1,
-1.499758, 0.389184, -1.089666, 1, 0.3607843, 0, 1,
-1.498788, 0.6193517, -3.134993, 1, 0.3647059, 0, 1,
-1.490221, -0.4964852, -2.290664, 1, 0.372549, 0, 1,
-1.489831, 1.852312, -0.9680092, 1, 0.3764706, 0, 1,
-1.489712, 1.400308, -1.073392, 1, 0.3843137, 0, 1,
-1.483672, -1.582725, -1.193355, 1, 0.3882353, 0, 1,
-1.451274, -0.8518942, -0.1205064, 1, 0.3960784, 0, 1,
-1.422312, 0.5340537, -1.161507, 1, 0.4039216, 0, 1,
-1.422218, 0.7513304, -2.603619, 1, 0.4078431, 0, 1,
-1.408126, 1.17198, -1.256242, 1, 0.4156863, 0, 1,
-1.405936, 1.107579, -2.986011, 1, 0.4196078, 0, 1,
-1.405934, 0.3380778, -2.029419, 1, 0.427451, 0, 1,
-1.401006, 0.06559485, -0.4677925, 1, 0.4313726, 0, 1,
-1.389262, -0.2070132, -1.264112, 1, 0.4392157, 0, 1,
-1.371083, -0.757327, -1.256711, 1, 0.4431373, 0, 1,
-1.359026, -1.320853, -4.479352, 1, 0.4509804, 0, 1,
-1.353067, -0.4798297, 1.005031, 1, 0.454902, 0, 1,
-1.352872, 0.2722133, -1.087741, 1, 0.4627451, 0, 1,
-1.348665, -0.001070261, -2.057518, 1, 0.4666667, 0, 1,
-1.343344, 0.7317126, -0.5051498, 1, 0.4745098, 0, 1,
-1.340443, 1.068202, -2.187859, 1, 0.4784314, 0, 1,
-1.340028, -0.8461353, -2.111869, 1, 0.4862745, 0, 1,
-1.334504, 0.1697438, -1.045626, 1, 0.4901961, 0, 1,
-1.333264, -1.721909, -2.654004, 1, 0.4980392, 0, 1,
-1.331602, 2.249959, -1.137146, 1, 0.5058824, 0, 1,
-1.329766, 0.600153, -0.6687502, 1, 0.509804, 0, 1,
-1.329412, 1.978654, -0.5743376, 1, 0.5176471, 0, 1,
-1.3214, 0.9429033, -1.853676, 1, 0.5215687, 0, 1,
-1.320637, 0.9437835, -1.12169, 1, 0.5294118, 0, 1,
-1.320029, 1.306378, 0.4171187, 1, 0.5333334, 0, 1,
-1.305477, -0.4396819, -1.218772, 1, 0.5411765, 0, 1,
-1.29485, -0.3406214, -0.3307931, 1, 0.5450981, 0, 1,
-1.289978, 1.04776, 0.3487956, 1, 0.5529412, 0, 1,
-1.289031, 1.826484, -0.6837541, 1, 0.5568628, 0, 1,
-1.283261, 0.1893948, -0.3013982, 1, 0.5647059, 0, 1,
-1.264958, 0.9147305, -1.275431, 1, 0.5686275, 0, 1,
-1.256732, -1.150124, -3.696317, 1, 0.5764706, 0, 1,
-1.255796, -0.5142847, -2.65826, 1, 0.5803922, 0, 1,
-1.251496, 0.003822884, -2.655136, 1, 0.5882353, 0, 1,
-1.25018, -0.07013643, -2.162786, 1, 0.5921569, 0, 1,
-1.240732, 1.166313, 1.131698, 1, 0.6, 0, 1,
-1.230581, -1.850517, -3.270729, 1, 0.6078432, 0, 1,
-1.229958, 0.07037748, -2.413012, 1, 0.6117647, 0, 1,
-1.214462, -1.098621, -3.374748, 1, 0.6196079, 0, 1,
-1.213567, 0.463246, -0.6365196, 1, 0.6235294, 0, 1,
-1.20233, 1.562937, -0.778424, 1, 0.6313726, 0, 1,
-1.198469, -0.5931986, -4.64896, 1, 0.6352941, 0, 1,
-1.193849, -0.4453878, -2.671288, 1, 0.6431373, 0, 1,
-1.188881, -0.01063182, -0.5053458, 1, 0.6470588, 0, 1,
-1.184752, 0.4175507, -1.80449, 1, 0.654902, 0, 1,
-1.18387, -0.04028267, -0.3637271, 1, 0.6588235, 0, 1,
-1.175876, 0.2647372, -1.30196, 1, 0.6666667, 0, 1,
-1.175868, 0.7589897, -1.652056, 1, 0.6705883, 0, 1,
-1.161251, -0.2685009, -3.49571, 1, 0.6784314, 0, 1,
-1.159161, -0.1111459, -1.490325, 1, 0.682353, 0, 1,
-1.152737, 0.4608421, -1.176872, 1, 0.6901961, 0, 1,
-1.139654, -0.1353235, -1.757057, 1, 0.6941177, 0, 1,
-1.139245, 0.6452485, 0.356531, 1, 0.7019608, 0, 1,
-1.138185, 1.854166, -2.145005, 1, 0.7098039, 0, 1,
-1.131639, -0.7083737, -2.466646, 1, 0.7137255, 0, 1,
-1.128164, 1.025569, -3.227329, 1, 0.7215686, 0, 1,
-1.12115, -0.0693341, -1.503749, 1, 0.7254902, 0, 1,
-1.119778, -0.4292598, -2.364058, 1, 0.7333333, 0, 1,
-1.117658, -0.9675984, -2.273024, 1, 0.7372549, 0, 1,
-1.106122, 0.08894563, -1.113428, 1, 0.7450981, 0, 1,
-1.099125, -0.2033926, -1.357122, 1, 0.7490196, 0, 1,
-1.097842, -1.168469, -2.202381, 1, 0.7568628, 0, 1,
-1.094172, -0.4181295, -0.3435871, 1, 0.7607843, 0, 1,
-1.088102, 2.030038, -0.7197263, 1, 0.7686275, 0, 1,
-1.082688, -0.07302837, -3.027576, 1, 0.772549, 0, 1,
-1.080636, -1.854477, -1.757734, 1, 0.7803922, 0, 1,
-1.079093, 0.4874478, -0.5435802, 1, 0.7843137, 0, 1,
-1.077173, 1.162803, 0.04389675, 1, 0.7921569, 0, 1,
-1.069081, 0.7820208, -0.8050299, 1, 0.7960784, 0, 1,
-1.067884, 1.014424, -0.5605183, 1, 0.8039216, 0, 1,
-1.06417, 0.9089419, -2.699451, 1, 0.8117647, 0, 1,
-1.055935, -0.2108647, -2.525926, 1, 0.8156863, 0, 1,
-1.055004, -0.396353, -0.5961073, 1, 0.8235294, 0, 1,
-1.052735, -1.19438, -2.259242, 1, 0.827451, 0, 1,
-1.049636, -0.9331256, -1.65484, 1, 0.8352941, 0, 1,
-1.046351, -1.354481, -2.390783, 1, 0.8392157, 0, 1,
-1.041375, 0.8606685, -0.936516, 1, 0.8470588, 0, 1,
-1.035433, 0.6659231, -0.3561103, 1, 0.8509804, 0, 1,
-1.033942, -1.116196, -2.68631, 1, 0.8588235, 0, 1,
-1.033542, 0.1389664, -2.989013, 1, 0.8627451, 0, 1,
-1.031694, 0.3104185, 0.4484728, 1, 0.8705882, 0, 1,
-1.031682, -0.454601, -1.972611, 1, 0.8745098, 0, 1,
-1.030593, -0.2767511, -1.658837, 1, 0.8823529, 0, 1,
-1.02826, 2.042403, -0.6315325, 1, 0.8862745, 0, 1,
-1.027821, 0.8327725, -1.49331, 1, 0.8941177, 0, 1,
-1.026143, -0.353086, -0.1826894, 1, 0.8980392, 0, 1,
-1.020352, -0.8240241, -2.90872, 1, 0.9058824, 0, 1,
-1.017444, 0.2565101, -1.444815, 1, 0.9137255, 0, 1,
-1.017194, 1.419889, -1.369399, 1, 0.9176471, 0, 1,
-1.015255, 1.167152, -0.2796994, 1, 0.9254902, 0, 1,
-1.013178, 0.5096951, -1.313135, 1, 0.9294118, 0, 1,
-1.012995, -0.8360788, -1.505433, 1, 0.9372549, 0, 1,
-1.008114, 0.1576936, -2.099245, 1, 0.9411765, 0, 1,
-1.007673, -2.310863, -3.048882, 1, 0.9490196, 0, 1,
-1.006919, 0.5724767, -1.891495, 1, 0.9529412, 0, 1,
-1.00431, -0.296912, -1.212015, 1, 0.9607843, 0, 1,
-1.002221, 1.550908, -0.4324693, 1, 0.9647059, 0, 1,
-1.00187, -1.466641, -4.244607, 1, 0.972549, 0, 1,
-1.001205, 0.04141317, -3.131484, 1, 0.9764706, 0, 1,
-0.9996856, -3.109195, -3.918965, 1, 0.9843137, 0, 1,
-0.992157, 0.3994702, -1.422728, 1, 0.9882353, 0, 1,
-0.9917322, 0.3188069, -0.8602088, 1, 0.9960784, 0, 1,
-0.9908496, -1.476074, -2.904275, 0.9960784, 1, 0, 1,
-0.9906054, -0.4043754, -2.623108, 0.9921569, 1, 0, 1,
-0.9896552, 0.5985572, -0.2594813, 0.9843137, 1, 0, 1,
-0.9868163, 1.400274, 0.215196, 0.9803922, 1, 0, 1,
-0.9813091, -1.03531, -1.674031, 0.972549, 1, 0, 1,
-0.9770066, 0.9314176, 0.2478246, 0.9686275, 1, 0, 1,
-0.9706801, 0.4325751, -2.299946, 0.9607843, 1, 0, 1,
-0.9646684, 0.1671676, -2.498518, 0.9568627, 1, 0, 1,
-0.9587534, 0.5416462, -1.264793, 0.9490196, 1, 0, 1,
-0.9573708, 0.5873132, 0.5305361, 0.945098, 1, 0, 1,
-0.9572246, -0.5421805, -1.798823, 0.9372549, 1, 0, 1,
-0.9564142, -0.7279184, 0.05024036, 0.9333333, 1, 0, 1,
-0.9544579, 0.3196453, -0.756856, 0.9254902, 1, 0, 1,
-0.9537981, 0.4805916, -0.5103124, 0.9215686, 1, 0, 1,
-0.9526225, -0.3761992, -1.565123, 0.9137255, 1, 0, 1,
-0.951139, -0.6778479, -2.259821, 0.9098039, 1, 0, 1,
-0.9509017, -0.783114, -3.073913, 0.9019608, 1, 0, 1,
-0.9481921, -1.802048, -3.461736, 0.8941177, 1, 0, 1,
-0.9481539, -0.8196676, -1.104714, 0.8901961, 1, 0, 1,
-0.9473336, 0.6283664, -0.9820576, 0.8823529, 1, 0, 1,
-0.9457409, -0.2242491, -3.267074, 0.8784314, 1, 0, 1,
-0.9316175, -0.280199, -2.587689, 0.8705882, 1, 0, 1,
-0.9296499, 0.4610183, -0.6489601, 0.8666667, 1, 0, 1,
-0.9289171, -0.008778384, -0.2356462, 0.8588235, 1, 0, 1,
-0.9287062, 0.7020671, -0.7830561, 0.854902, 1, 0, 1,
-0.9257431, -0.7189296, -2.050791, 0.8470588, 1, 0, 1,
-0.9235013, -0.1935739, -2.217195, 0.8431373, 1, 0, 1,
-0.9225669, 1.395029, 1.934404, 0.8352941, 1, 0, 1,
-0.9155475, -0.05491204, -3.250492, 0.8313726, 1, 0, 1,
-0.9118362, 0.9736369, -2.536751, 0.8235294, 1, 0, 1,
-0.9089008, -1.268206, -2.21301, 0.8196079, 1, 0, 1,
-0.8996681, 1.122746, -2.019017, 0.8117647, 1, 0, 1,
-0.8948748, 0.4408452, -1.274422, 0.8078431, 1, 0, 1,
-0.8917226, -1.170791, -1.411944, 0.8, 1, 0, 1,
-0.8904662, -0.2811339, -0.06598764, 0.7921569, 1, 0, 1,
-0.8903078, 0.5339349, -1.161458, 0.7882353, 1, 0, 1,
-0.8889461, -0.5774074, -1.778128, 0.7803922, 1, 0, 1,
-0.8889412, -0.4138603, -0.05975862, 0.7764706, 1, 0, 1,
-0.8873292, 1.147397, -1.125715, 0.7686275, 1, 0, 1,
-0.8845246, 0.7820652, -2.269431, 0.7647059, 1, 0, 1,
-0.877587, 0.4605606, -2.642771, 0.7568628, 1, 0, 1,
-0.8767352, -1.821571, -0.4473773, 0.7529412, 1, 0, 1,
-0.874159, 0.91709, -1.183638, 0.7450981, 1, 0, 1,
-0.870599, 0.3615668, -0.8659124, 0.7411765, 1, 0, 1,
-0.8643134, -1.034858, -3.573809, 0.7333333, 1, 0, 1,
-0.8587393, 0.4572462, -0.7188735, 0.7294118, 1, 0, 1,
-0.8580073, 0.913156, -0.9017849, 0.7215686, 1, 0, 1,
-0.8573068, -0.06178212, 0.9428533, 0.7176471, 1, 0, 1,
-0.8466101, -0.6057659, -2.173526, 0.7098039, 1, 0, 1,
-0.8458893, -1.043322, -2.056689, 0.7058824, 1, 0, 1,
-0.8413752, -0.1346939, -1.862365, 0.6980392, 1, 0, 1,
-0.8395427, -0.06720201, -2.755808, 0.6901961, 1, 0, 1,
-0.8345101, 0.4399839, -1.706042, 0.6862745, 1, 0, 1,
-0.8340986, 1.092476, 0.3502752, 0.6784314, 1, 0, 1,
-0.8311977, -1.071709, -0.7291747, 0.6745098, 1, 0, 1,
-0.8303565, 0.3443387, -2.216559, 0.6666667, 1, 0, 1,
-0.8298846, 0.1175905, -2.177298, 0.6627451, 1, 0, 1,
-0.8298403, -0.002179581, -1.827177, 0.654902, 1, 0, 1,
-0.8275242, -1.726308, -3.295468, 0.6509804, 1, 0, 1,
-0.8267093, -0.7004384, -2.611553, 0.6431373, 1, 0, 1,
-0.820462, -0.03139554, -1.138601, 0.6392157, 1, 0, 1,
-0.8195128, -1.325092, -3.330853, 0.6313726, 1, 0, 1,
-0.8178395, 0.4514091, -0.9797369, 0.627451, 1, 0, 1,
-0.8138887, 0.1208777, -1.653208, 0.6196079, 1, 0, 1,
-0.8075689, 0.07563084, -0.9706118, 0.6156863, 1, 0, 1,
-0.8067161, -0.6527568, -2.296125, 0.6078432, 1, 0, 1,
-0.8034228, 0.518217, -2.07528, 0.6039216, 1, 0, 1,
-0.800438, -1.555371, -6.155705, 0.5960785, 1, 0, 1,
-0.8003565, 1.150814, -0.7757682, 0.5882353, 1, 0, 1,
-0.7959468, -1.363406, -1.589868, 0.5843138, 1, 0, 1,
-0.7952451, 2.049533, -2.118671, 0.5764706, 1, 0, 1,
-0.7947992, -0.8250827, -2.98936, 0.572549, 1, 0, 1,
-0.7933373, 0.8696769, -2.012119, 0.5647059, 1, 0, 1,
-0.7902378, 0.2849469, 0.1581614, 0.5607843, 1, 0, 1,
-0.7853035, 0.2949692, -0.4389285, 0.5529412, 1, 0, 1,
-0.778401, -0.07838701, -1.993829, 0.5490196, 1, 0, 1,
-0.7775518, -1.003339, -3.010998, 0.5411765, 1, 0, 1,
-0.7757013, 0.3784937, -0.1970185, 0.5372549, 1, 0, 1,
-0.7741004, -1.603271, -2.403643, 0.5294118, 1, 0, 1,
-0.7735738, -0.5275772, -3.261384, 0.5254902, 1, 0, 1,
-0.769877, 0.5900155, -2.770478, 0.5176471, 1, 0, 1,
-0.7690327, -1.029491, -1.314303, 0.5137255, 1, 0, 1,
-0.7662077, -1.689631, -3.87631, 0.5058824, 1, 0, 1,
-0.7631752, 0.3388326, -1.10457, 0.5019608, 1, 0, 1,
-0.7586098, -2.040061, -3.145729, 0.4941176, 1, 0, 1,
-0.7552271, -1.851194, -3.893784, 0.4862745, 1, 0, 1,
-0.7541448, -1.337603, -3.686729, 0.4823529, 1, 0, 1,
-0.7528142, -1.409173, -2.03124, 0.4745098, 1, 0, 1,
-0.7522442, -0.4352317, -1.646791, 0.4705882, 1, 0, 1,
-0.7501592, -1.199327, -3.821065, 0.4627451, 1, 0, 1,
-0.7453487, 1.583007, 0.8886913, 0.4588235, 1, 0, 1,
-0.7440554, -0.6257356, -1.877104, 0.4509804, 1, 0, 1,
-0.7433597, 1.163049, 0.3217484, 0.4470588, 1, 0, 1,
-0.7341568, -0.5693809, -1.573814, 0.4392157, 1, 0, 1,
-0.732919, 2.506671, 0.5228942, 0.4352941, 1, 0, 1,
-0.7288786, -0.3600365, -2.154026, 0.427451, 1, 0, 1,
-0.7258268, -0.8457131, -0.7329344, 0.4235294, 1, 0, 1,
-0.7252586, -0.5946522, -1.847414, 0.4156863, 1, 0, 1,
-0.724811, -1.336423, -1.465849, 0.4117647, 1, 0, 1,
-0.7134228, -1.220559, -3.340972, 0.4039216, 1, 0, 1,
-0.7089868, -1.105261, -2.0654, 0.3960784, 1, 0, 1,
-0.706274, -0.4062474, -1.53739, 0.3921569, 1, 0, 1,
-0.7019379, 0.0560446, -3.184731, 0.3843137, 1, 0, 1,
-0.6997216, -0.8503618, -2.74358, 0.3803922, 1, 0, 1,
-0.6984996, -0.4581097, -2.589772, 0.372549, 1, 0, 1,
-0.6954334, 0.5580505, -0.550765, 0.3686275, 1, 0, 1,
-0.6906345, 0.3676475, -1.303427, 0.3607843, 1, 0, 1,
-0.6889625, -2.161079, -1.967479, 0.3568628, 1, 0, 1,
-0.6886003, -0.3473396, -2.758911, 0.3490196, 1, 0, 1,
-0.6862558, -0.2768428, -2.310828, 0.345098, 1, 0, 1,
-0.6767809, -1.211934, -3.662042, 0.3372549, 1, 0, 1,
-0.6762163, 0.0798733, -3.443264, 0.3333333, 1, 0, 1,
-0.6759337, 1.13665, 2.324414, 0.3254902, 1, 0, 1,
-0.6756425, 0.06730065, -1.832832, 0.3215686, 1, 0, 1,
-0.674999, -0.746325, -1.612927, 0.3137255, 1, 0, 1,
-0.6733051, -1.31515, -2.434687, 0.3098039, 1, 0, 1,
-0.6730129, -0.01706953, -2.667601, 0.3019608, 1, 0, 1,
-0.6685886, 0.9372059, -1.338903, 0.2941177, 1, 0, 1,
-0.6635337, 0.7439305, -1.490132, 0.2901961, 1, 0, 1,
-0.660125, 0.9894006, -0.05836633, 0.282353, 1, 0, 1,
-0.6589318, 0.6455237, -0.1832425, 0.2784314, 1, 0, 1,
-0.6581208, 0.8936996, -0.9788111, 0.2705882, 1, 0, 1,
-0.6567979, -0.9319414, -4.033812, 0.2666667, 1, 0, 1,
-0.6564829, -0.8907468, -2.188944, 0.2588235, 1, 0, 1,
-0.6553807, -0.2172969, -2.703359, 0.254902, 1, 0, 1,
-0.6539745, 1.162554, 0.03248609, 0.2470588, 1, 0, 1,
-0.6530822, 0.7966229, -1.253049, 0.2431373, 1, 0, 1,
-0.649536, 0.0626407, -1.512442, 0.2352941, 1, 0, 1,
-0.6444553, -1.192551, -4.249261, 0.2313726, 1, 0, 1,
-0.6433184, 0.5038226, -0.55916, 0.2235294, 1, 0, 1,
-0.6412303, -1.627674, -1.677626, 0.2196078, 1, 0, 1,
-0.6411778, 0.736008, -1.700375, 0.2117647, 1, 0, 1,
-0.6400302, -0.8943193, -1.822584, 0.2078431, 1, 0, 1,
-0.6398812, 0.9963701, 0.5662239, 0.2, 1, 0, 1,
-0.6338375, -1.054611, -2.865473, 0.1921569, 1, 0, 1,
-0.6294816, 0.1361413, -1.684552, 0.1882353, 1, 0, 1,
-0.6286502, 0.728442, 0.0356821, 0.1803922, 1, 0, 1,
-0.6232885, -0.1903879, -0.9589991, 0.1764706, 1, 0, 1,
-0.6209789, 1.569999, -1.657205, 0.1686275, 1, 0, 1,
-0.6105514, 0.1822037, -0.8015811, 0.1647059, 1, 0, 1,
-0.6056519, 0.6292853, -2.597121, 0.1568628, 1, 0, 1,
-0.6053582, -0.2465457, -0.9676763, 0.1529412, 1, 0, 1,
-0.599824, -1.232196, -2.454004, 0.145098, 1, 0, 1,
-0.5968255, -0.8972217, -2.490607, 0.1411765, 1, 0, 1,
-0.5786228, -0.6965367, -1.580357, 0.1333333, 1, 0, 1,
-0.5740902, 0.1235382, -1.49757, 0.1294118, 1, 0, 1,
-0.566438, 0.605181, -1.533102, 0.1215686, 1, 0, 1,
-0.5635782, 0.1685571, -1.71245, 0.1176471, 1, 0, 1,
-0.5620983, -0.8993407, -2.309581, 0.1098039, 1, 0, 1,
-0.5618702, 0.2093856, -0.8912439, 0.1058824, 1, 0, 1,
-0.5609729, -0.8660249, -2.692393, 0.09803922, 1, 0, 1,
-0.5602081, 0.6156638, -0.8187305, 0.09019608, 1, 0, 1,
-0.5548946, -1.308893, -2.242367, 0.08627451, 1, 0, 1,
-0.5463096, 1.103497, 0.3026166, 0.07843138, 1, 0, 1,
-0.5435098, -0.4882065, -3.980678, 0.07450981, 1, 0, 1,
-0.5433949, -0.121956, -3.91355, 0.06666667, 1, 0, 1,
-0.5423759, 1.829757, 0.4674855, 0.0627451, 1, 0, 1,
-0.5414639, -0.01775699, -2.382413, 0.05490196, 1, 0, 1,
-0.5390531, 1.297881, -2.361536, 0.05098039, 1, 0, 1,
-0.5382633, -1.531793, -2.44869, 0.04313726, 1, 0, 1,
-0.5329619, -0.384577, -3.075104, 0.03921569, 1, 0, 1,
-0.5301477, 1.935957, 0.4436408, 0.03137255, 1, 0, 1,
-0.5254232, -1.390504, -2.720549, 0.02745098, 1, 0, 1,
-0.5225967, -0.1645674, -1.615879, 0.01960784, 1, 0, 1,
-0.5154881, -0.6362488, -3.655077, 0.01568628, 1, 0, 1,
-0.5149884, -1.860359, -4.362909, 0.007843138, 1, 0, 1,
-0.5148519, -1.175747, -2.54034, 0.003921569, 1, 0, 1,
-0.5090562, -0.3791607, -0.3035273, 0, 1, 0.003921569, 1,
-0.5083854, 0.2288481, -2.904976, 0, 1, 0.01176471, 1,
-0.5082934, -0.9213974, -3.6667, 0, 1, 0.01568628, 1,
-0.5074555, 0.2708994, -0.8541722, 0, 1, 0.02352941, 1,
-0.5029031, 0.611397, -1.676667, 0, 1, 0.02745098, 1,
-0.5019593, 0.5332649, 0.274927, 0, 1, 0.03529412, 1,
-0.4985416, -0.2521185, -3.046313, 0, 1, 0.03921569, 1,
-0.4968586, 2.555349, 0.5900344, 0, 1, 0.04705882, 1,
-0.4884226, 1.023767, -1.299673, 0, 1, 0.05098039, 1,
-0.4874891, 1.460821, 0.1978622, 0, 1, 0.05882353, 1,
-0.4849078, 1.670204, -1.831433, 0, 1, 0.0627451, 1,
-0.4815307, -0.5624486, -3.2496, 0, 1, 0.07058824, 1,
-0.4772177, 2.46072, 0.2322655, 0, 1, 0.07450981, 1,
-0.4696954, 1.110084, -0.08950314, 0, 1, 0.08235294, 1,
-0.4691828, 0.007854127, -2.975044, 0, 1, 0.08627451, 1,
-0.4666789, -0.6270404, -3.117555, 0, 1, 0.09411765, 1,
-0.4657744, -0.1764275, 0.03006139, 0, 1, 0.1019608, 1,
-0.4648499, 0.2040863, -1.14716, 0, 1, 0.1058824, 1,
-0.4619076, 0.1885998, -2.358797, 0, 1, 0.1137255, 1,
-0.4618381, -1.028662, -3.221537, 0, 1, 0.1176471, 1,
-0.4569272, -0.431191, -2.892553, 0, 1, 0.1254902, 1,
-0.4567441, 0.6456094, 1.972907, 0, 1, 0.1294118, 1,
-0.453172, 0.4814738, -1.46773, 0, 1, 0.1372549, 1,
-0.4517311, -0.34493, -2.055742, 0, 1, 0.1411765, 1,
-0.4502482, 0.4383991, -1.602606, 0, 1, 0.1490196, 1,
-0.4488769, 0.8961145, 0.9126878, 0, 1, 0.1529412, 1,
-0.4448912, 0.7120308, -0.02934107, 0, 1, 0.1607843, 1,
-0.4434965, 1.263411, 0.9870417, 0, 1, 0.1647059, 1,
-0.4395716, -0.4080071, -2.225877, 0, 1, 0.172549, 1,
-0.4394461, 0.6502681, 1.077743, 0, 1, 0.1764706, 1,
-0.4372816, 0.1489253, -0.8430377, 0, 1, 0.1843137, 1,
-0.436745, 0.9659536, 0.2500266, 0, 1, 0.1882353, 1,
-0.4350874, -0.313246, -4.173271, 0, 1, 0.1960784, 1,
-0.4341511, -0.4343421, -1.021107, 0, 1, 0.2039216, 1,
-0.4330222, 0.565282, -2.417238, 0, 1, 0.2078431, 1,
-0.431134, 0.7522362, -0.9516565, 0, 1, 0.2156863, 1,
-0.4307896, 1.001435, 0.5112812, 0, 1, 0.2196078, 1,
-0.430456, -0.3679194, -2.657123, 0, 1, 0.227451, 1,
-0.429796, 0.5805032, 0.3473991, 0, 1, 0.2313726, 1,
-0.4277067, 0.1437152, -0.9662465, 0, 1, 0.2392157, 1,
-0.4276369, -0.1102801, -1.235598, 0, 1, 0.2431373, 1,
-0.4197461, -0.3601967, -3.25999, 0, 1, 0.2509804, 1,
-0.4183778, 0.5392188, -1.453561, 0, 1, 0.254902, 1,
-0.4140041, 1.033262, -0.3215621, 0, 1, 0.2627451, 1,
-0.4111546, 0.8001831, -0.02172626, 0, 1, 0.2666667, 1,
-0.4090945, -0.01839171, -0.7665386, 0, 1, 0.2745098, 1,
-0.4077969, 0.09934323, -1.33285, 0, 1, 0.2784314, 1,
-0.4069302, 0.4796786, -2.823756, 0, 1, 0.2862745, 1,
-0.4010879, -0.737078, -3.745677, 0, 1, 0.2901961, 1,
-0.3974937, -0.2829785, -3.772282, 0, 1, 0.2980392, 1,
-0.3959204, -0.3581633, -2.195592, 0, 1, 0.3058824, 1,
-0.3846997, 0.2079401, -0.6065046, 0, 1, 0.3098039, 1,
-0.3838102, -0.4414479, -2.185912, 0, 1, 0.3176471, 1,
-0.3808773, -0.1091011, -0.4765641, 0, 1, 0.3215686, 1,
-0.3609881, -1.154424, -2.061816, 0, 1, 0.3294118, 1,
-0.3604699, 0.4769664, -0.512159, 0, 1, 0.3333333, 1,
-0.3591004, -2.474422, -2.965124, 0, 1, 0.3411765, 1,
-0.3576692, -0.868744, -1.395185, 0, 1, 0.345098, 1,
-0.3539833, 0.3280417, -1.691972, 0, 1, 0.3529412, 1,
-0.3496817, -0.04504052, -2.174364, 0, 1, 0.3568628, 1,
-0.3473128, 2.352234, 1.317699, 0, 1, 0.3647059, 1,
-0.3454704, 0.3002781, 0.09280465, 0, 1, 0.3686275, 1,
-0.3423775, 0.3010266, -0.6959359, 0, 1, 0.3764706, 1,
-0.3413749, -0.2499698, -2.822158, 0, 1, 0.3803922, 1,
-0.3403352, -1.391804, -2.449511, 0, 1, 0.3882353, 1,
-0.3364087, -0.7900176, -2.352448, 0, 1, 0.3921569, 1,
-0.3317058, -1.625601, -2.347591, 0, 1, 0.4, 1,
-0.3300966, 1.532788, -1.189851, 0, 1, 0.4078431, 1,
-0.320646, -1.130036, -3.471086, 0, 1, 0.4117647, 1,
-0.3105696, -1.110047, -1.597459, 0, 1, 0.4196078, 1,
-0.3089794, -0.6313136, -2.264205, 0, 1, 0.4235294, 1,
-0.3087162, -1.234816, -2.319396, 0, 1, 0.4313726, 1,
-0.3033959, -1.474577, -2.207515, 0, 1, 0.4352941, 1,
-0.3026612, -0.3416947, -3.004042, 0, 1, 0.4431373, 1,
-0.2989756, 0.1222593, -1.410384, 0, 1, 0.4470588, 1,
-0.2989688, 0.02859778, -1.474178, 0, 1, 0.454902, 1,
-0.2984463, -0.07453753, -1.910468, 0, 1, 0.4588235, 1,
-0.2983697, -1.453453, -3.025491, 0, 1, 0.4666667, 1,
-0.2956006, -0.4312247, -2.181845, 0, 1, 0.4705882, 1,
-0.2952536, -0.4376695, -2.101578, 0, 1, 0.4784314, 1,
-0.2899544, 0.5324252, -0.3199456, 0, 1, 0.4823529, 1,
-0.2896191, 0.3626397, -0.402579, 0, 1, 0.4901961, 1,
-0.2849403, -1.16488, -2.578863, 0, 1, 0.4941176, 1,
-0.2842726, -1.239151, -3.680388, 0, 1, 0.5019608, 1,
-0.2742948, 0.44427, 0.0862252, 0, 1, 0.509804, 1,
-0.2738267, -1.860776, -4.739417, 0, 1, 0.5137255, 1,
-0.272979, -0.5048775, -1.132455, 0, 1, 0.5215687, 1,
-0.2718088, -0.5551237, -3.161052, 0, 1, 0.5254902, 1,
-0.2707086, 0.6834332, -0.2267286, 0, 1, 0.5333334, 1,
-0.2665257, 0.8135996, -2.06393, 0, 1, 0.5372549, 1,
-0.2659545, -0.6818572, -0.9693258, 0, 1, 0.5450981, 1,
-0.2643981, -0.5495126, -2.634927, 0, 1, 0.5490196, 1,
-0.2547362, -1.061039, -4.179076, 0, 1, 0.5568628, 1,
-0.2542432, 0.8519018, -1.35956, 0, 1, 0.5607843, 1,
-0.251148, -0.9963319, -1.546348, 0, 1, 0.5686275, 1,
-0.2491306, 0.0578048, -1.115308, 0, 1, 0.572549, 1,
-0.2476933, 0.4378453, -1.766618, 0, 1, 0.5803922, 1,
-0.2424105, -2.097711, -2.36158, 0, 1, 0.5843138, 1,
-0.2421912, 0.8935351, -0.35316, 0, 1, 0.5921569, 1,
-0.2411022, -1.863987, -4.665441, 0, 1, 0.5960785, 1,
-0.2338126, -0.7387238, -3.114208, 0, 1, 0.6039216, 1,
-0.230867, 1.589798, 0.5058894, 0, 1, 0.6117647, 1,
-0.2302222, -1.293067, -2.734784, 0, 1, 0.6156863, 1,
-0.2295824, -1.791305, -2.891289, 0, 1, 0.6235294, 1,
-0.229161, -1.162438, -4.247748, 0, 1, 0.627451, 1,
-0.2261467, 0.2566455, -1.771064, 0, 1, 0.6352941, 1,
-0.2254276, 0.09666505, -0.9256913, 0, 1, 0.6392157, 1,
-0.2246185, 0.6157273, -0.6538395, 0, 1, 0.6470588, 1,
-0.2232376, 0.0952038, -0.9284993, 0, 1, 0.6509804, 1,
-0.2227701, -0.1274506, -3.765385, 0, 1, 0.6588235, 1,
-0.2214594, -1.71731, -3.372661, 0, 1, 0.6627451, 1,
-0.2211948, 1.216533, 0.1419312, 0, 1, 0.6705883, 1,
-0.215461, 0.8398311, -1.137217, 0, 1, 0.6745098, 1,
-0.2148967, -0.6072679, -1.518116, 0, 1, 0.682353, 1,
-0.2133259, 0.09815182, -1.030563, 0, 1, 0.6862745, 1,
-0.2122142, 0.4447893, -0.5861785, 0, 1, 0.6941177, 1,
-0.2119343, 0.2942944, -0.6297268, 0, 1, 0.7019608, 1,
-0.2085025, 0.3068745, -0.1976343, 0, 1, 0.7058824, 1,
-0.207782, -0.26471, -4.079731, 0, 1, 0.7137255, 1,
-0.2060554, -0.256804, -1.507826, 0, 1, 0.7176471, 1,
-0.2028884, -1.184697, -2.067214, 0, 1, 0.7254902, 1,
-0.2016616, -0.4464369, -2.695896, 0, 1, 0.7294118, 1,
-0.1968281, 0.8717391, -0.2171859, 0, 1, 0.7372549, 1,
-0.1932486, 1.338898, -1.404952, 0, 1, 0.7411765, 1,
-0.1871008, -0.2042081, -0.6483732, 0, 1, 0.7490196, 1,
-0.1865986, 0.6390232, 1.083987, 0, 1, 0.7529412, 1,
-0.1835631, 1.984194, -0.6786342, 0, 1, 0.7607843, 1,
-0.1817372, -0.9018428, -3.133362, 0, 1, 0.7647059, 1,
-0.1800109, 0.5085899, 0.6667392, 0, 1, 0.772549, 1,
-0.1747285, -1.098742, -2.022725, 0, 1, 0.7764706, 1,
-0.1717904, 1.268341, 1.164928, 0, 1, 0.7843137, 1,
-0.1679122, -0.2836031, -1.62912, 0, 1, 0.7882353, 1,
-0.1658819, -0.2616922, -1.707034, 0, 1, 0.7960784, 1,
-0.1654691, -0.1782153, -1.751264, 0, 1, 0.8039216, 1,
-0.1524752, 1.208901, -0.270012, 0, 1, 0.8078431, 1,
-0.1483915, -0.1386751, -1.459345, 0, 1, 0.8156863, 1,
-0.1463359, 1.481645, 0.902715, 0, 1, 0.8196079, 1,
-0.1446756, 1.158846, -1.666473, 0, 1, 0.827451, 1,
-0.14027, 0.373277, 0.9544953, 0, 1, 0.8313726, 1,
-0.1371323, 1.801606, -1.658062, 0, 1, 0.8392157, 1,
-0.135492, -0.9022482, -1.834317, 0, 1, 0.8431373, 1,
-0.1291113, 1.818234, -1.311355, 0, 1, 0.8509804, 1,
-0.1279099, -1.081169, -2.537687, 0, 1, 0.854902, 1,
-0.126192, 0.6976167, 0.1789558, 0, 1, 0.8627451, 1,
-0.1239641, 0.8672607, 0.05390967, 0, 1, 0.8666667, 1,
-0.1236734, 1.474646, -1.065359, 0, 1, 0.8745098, 1,
-0.1188348, -0.2986766, -3.860807, 0, 1, 0.8784314, 1,
-0.1161999, -0.6177412, -2.541885, 0, 1, 0.8862745, 1,
-0.1146736, -0.9342654, -4.514813, 0, 1, 0.8901961, 1,
-0.1127904, 1.208441, -0.7390893, 0, 1, 0.8980392, 1,
-0.1117833, 0.9322082, 0.1166673, 0, 1, 0.9058824, 1,
-0.1109336, 0.5130914, -0.7977774, 0, 1, 0.9098039, 1,
-0.1102287, -1.348855, -5.132767, 0, 1, 0.9176471, 1,
-0.1081702, 0.6345941, -0.6319876, 0, 1, 0.9215686, 1,
-0.1020817, 0.4185458, 0.7773286, 0, 1, 0.9294118, 1,
-0.09910198, -0.1298205, -1.232918, 0, 1, 0.9333333, 1,
-0.09894766, -0.139114, -4.104448, 0, 1, 0.9411765, 1,
-0.09199294, -0.6968099, -4.662799, 0, 1, 0.945098, 1,
-0.09183935, -0.1834706, -3.346579, 0, 1, 0.9529412, 1,
-0.09069329, -0.7681618, -1.457565, 0, 1, 0.9568627, 1,
-0.09063698, 1.063181, -0.3377931, 0, 1, 0.9647059, 1,
-0.08521757, 0.07493051, -0.9606538, 0, 1, 0.9686275, 1,
-0.08083992, -0.7861636, -2.625193, 0, 1, 0.9764706, 1,
-0.07654473, -0.4222827, -3.386009, 0, 1, 0.9803922, 1,
-0.07555207, 0.7637873, 0.4412599, 0, 1, 0.9882353, 1,
-0.07419399, 0.1382248, -0.914842, 0, 1, 0.9921569, 1,
-0.07319135, 0.4267347, -0.8126007, 0, 1, 1, 1,
-0.06960437, 0.1691922, -0.5801765, 0, 0.9921569, 1, 1,
-0.06767938, -2.033311, -3.491095, 0, 0.9882353, 1, 1,
-0.06681738, -1.487759, -3.700008, 0, 0.9803922, 1, 1,
-0.06632288, 0.6556791, -0.08751017, 0, 0.9764706, 1, 1,
-0.06553196, 0.922734, 0.06114407, 0, 0.9686275, 1, 1,
-0.06316192, -0.3647799, -3.155341, 0, 0.9647059, 1, 1,
-0.05810719, -0.1979107, -2.554882, 0, 0.9568627, 1, 1,
-0.05801005, 0.3577519, -0.1212602, 0, 0.9529412, 1, 1,
-0.05591122, -2.26913, -3.718174, 0, 0.945098, 1, 1,
-0.05396162, -0.2764744, -1.394577, 0, 0.9411765, 1, 1,
-0.04792044, -2.698653, -2.494337, 0, 0.9333333, 1, 1,
-0.04734224, -0.7225216, -4.142673, 0, 0.9294118, 1, 1,
-0.04629754, -0.3691408, -2.479515, 0, 0.9215686, 1, 1,
-0.04550301, 0.001148505, -1.401411, 0, 0.9176471, 1, 1,
-0.04247347, 0.1128376, -1.891369, 0, 0.9098039, 1, 1,
-0.0413187, 1.337446, -0.2970544, 0, 0.9058824, 1, 1,
-0.04119462, -0.569856, -2.116136, 0, 0.8980392, 1, 1,
-0.03909149, -0.5646841, -3.623808, 0, 0.8901961, 1, 1,
-0.0386774, 0.1779057, 0.103989, 0, 0.8862745, 1, 1,
-0.03791429, -0.6152931, -3.960338, 0, 0.8784314, 1, 1,
-0.03232963, -0.277576, -4.93362, 0, 0.8745098, 1, 1,
-0.02969724, 0.3224745, -0.3801821, 0, 0.8666667, 1, 1,
-0.02710809, -1.011099, -1.685758, 0, 0.8627451, 1, 1,
-0.02688185, 0.7702141, -1.413924, 0, 0.854902, 1, 1,
-0.02565853, -0.401719, -2.214781, 0, 0.8509804, 1, 1,
-0.02485456, -2.020487, -1.860121, 0, 0.8431373, 1, 1,
-0.02468072, -0.1374539, -2.945242, 0, 0.8392157, 1, 1,
-0.02137969, -0.2809908, -5.402136, 0, 0.8313726, 1, 1,
-0.01923507, 1.168326, 0.8420496, 0, 0.827451, 1, 1,
-0.01676323, 0.7332926, -0.9602497, 0, 0.8196079, 1, 1,
-0.01549447, -0.1090104, -1.541803, 0, 0.8156863, 1, 1,
-0.01491003, -0.4959316, -3.540494, 0, 0.8078431, 1, 1,
-0.01349892, -1.904703, -4.321694, 0, 0.8039216, 1, 1,
-0.009238819, -1.428227, -3.877904, 0, 0.7960784, 1, 1,
-0.00762417, -0.9567673, -3.085284, 0, 0.7882353, 1, 1,
0.003808828, -0.09911327, 3.03267, 0, 0.7843137, 1, 1,
0.003859602, 1.24476, -1.271449, 0, 0.7764706, 1, 1,
0.004546345, -0.3389539, 2.188784, 0, 0.772549, 1, 1,
0.004825788, 0.06970217, -1.240126, 0, 0.7647059, 1, 1,
0.009606491, -1.941271, 3.695291, 0, 0.7607843, 1, 1,
0.01251243, -0.1848202, 3.565165, 0, 0.7529412, 1, 1,
0.01547467, -0.8461264, 3.241221, 0, 0.7490196, 1, 1,
0.01643511, 1.225556, 0.7872201, 0, 0.7411765, 1, 1,
0.01715291, 0.8155639, -0.4455753, 0, 0.7372549, 1, 1,
0.017904, -0.1115675, 3.330162, 0, 0.7294118, 1, 1,
0.02980753, 0.03110647, 1.399631, 0, 0.7254902, 1, 1,
0.03049977, -0.3288537, 4.825925, 0, 0.7176471, 1, 1,
0.03242862, 0.4151902, 0.5695508, 0, 0.7137255, 1, 1,
0.04074793, 1.73533, -0.6219236, 0, 0.7058824, 1, 1,
0.04198601, 0.4032074, 0.3539147, 0, 0.6980392, 1, 1,
0.04345196, -0.4920267, 2.672755, 0, 0.6941177, 1, 1,
0.04464294, -0.2005427, 1.692528, 0, 0.6862745, 1, 1,
0.04760153, -0.03176425, 2.608508, 0, 0.682353, 1, 1,
0.04975644, -1.096981, 2.314664, 0, 0.6745098, 1, 1,
0.05003982, 0.3587527, -1.647074, 0, 0.6705883, 1, 1,
0.05353469, -0.4294358, 3.689016, 0, 0.6627451, 1, 1,
0.05515909, -1.057283, 1.181087, 0, 0.6588235, 1, 1,
0.05603185, 0.3601167, -0.02838337, 0, 0.6509804, 1, 1,
0.05835639, -0.4822619, 4.258597, 0, 0.6470588, 1, 1,
0.06102835, -0.1246932, 3.688682, 0, 0.6392157, 1, 1,
0.06658138, 0.7962468, 0.008196345, 0, 0.6352941, 1, 1,
0.06667262, 0.1814032, 0.4376016, 0, 0.627451, 1, 1,
0.07034891, -0.1531053, 3.067355, 0, 0.6235294, 1, 1,
0.07123118, -0.8953197, 3.498702, 0, 0.6156863, 1, 1,
0.07390779, 0.7663786, -0.3543804, 0, 0.6117647, 1, 1,
0.07514248, -2.192485, 3.701711, 0, 0.6039216, 1, 1,
0.07537388, -0.07961281, 2.269862, 0, 0.5960785, 1, 1,
0.07693798, -1.3422, 2.910634, 0, 0.5921569, 1, 1,
0.07905752, -2.229211, 3.128499, 0, 0.5843138, 1, 1,
0.09271079, 1.039061, 0.7035928, 0, 0.5803922, 1, 1,
0.1001851, -0.7554017, 4.954741, 0, 0.572549, 1, 1,
0.1015601, -0.4743603, 2.258684, 0, 0.5686275, 1, 1,
0.1023628, -0.2201694, 2.912601, 0, 0.5607843, 1, 1,
0.1044284, 0.8714814, 0.2707805, 0, 0.5568628, 1, 1,
0.1185544, -0.5545896, 4.569286, 0, 0.5490196, 1, 1,
0.1192938, -0.9703891, 4.597569, 0, 0.5450981, 1, 1,
0.1222497, 0.5256968, 1.852238, 0, 0.5372549, 1, 1,
0.1307066, -1.925159, 1.99935, 0, 0.5333334, 1, 1,
0.1338541, -0.8923407, 2.413472, 0, 0.5254902, 1, 1,
0.1381768, 1.339724, 0.9616138, 0, 0.5215687, 1, 1,
0.1413096, 0.507257, -0.5932069, 0, 0.5137255, 1, 1,
0.1413571, -1.002648, 3.87095, 0, 0.509804, 1, 1,
0.1461021, -0.3231535, 1.360482, 0, 0.5019608, 1, 1,
0.1480868, -0.6172558, 3.291393, 0, 0.4941176, 1, 1,
0.1501514, 0.7417332, 0.06852465, 0, 0.4901961, 1, 1,
0.1511728, -0.008019222, 1.73612, 0, 0.4823529, 1, 1,
0.1522048, -0.4974546, 3.277927, 0, 0.4784314, 1, 1,
0.1590458, 0.8280664, -0.03091894, 0, 0.4705882, 1, 1,
0.1606086, -0.7623315, 1.567506, 0, 0.4666667, 1, 1,
0.164461, -0.8054449, 3.95261, 0, 0.4588235, 1, 1,
0.166538, -0.1750599, 5.129912, 0, 0.454902, 1, 1,
0.1667596, 0.2488361, 0.07596911, 0, 0.4470588, 1, 1,
0.1668035, -0.2039132, 2.755246, 0, 0.4431373, 1, 1,
0.1692641, 0.5365826, -0.9173831, 0, 0.4352941, 1, 1,
0.1697946, 0.3937812, 1.244597, 0, 0.4313726, 1, 1,
0.171029, -0.1852847, 1.644301, 0, 0.4235294, 1, 1,
0.1712575, 0.06019368, 1.231, 0, 0.4196078, 1, 1,
0.1743315, 0.3121506, -1.06738, 0, 0.4117647, 1, 1,
0.1772319, -0.7228748, 3.476473, 0, 0.4078431, 1, 1,
0.1775135, -0.5618663, 3.783742, 0, 0.4, 1, 1,
0.1809203, -0.707464, 4.160184, 0, 0.3921569, 1, 1,
0.1871748, -0.5737349, 3.22795, 0, 0.3882353, 1, 1,
0.1894039, 0.8591385, -0.4103577, 0, 0.3803922, 1, 1,
0.1928031, -3.006819, 3.22696, 0, 0.3764706, 1, 1,
0.1945553, 0.6440069, -0.6842847, 0, 0.3686275, 1, 1,
0.1973162, 1.418408, -0.106232, 0, 0.3647059, 1, 1,
0.200146, 0.4286152, 1.870839, 0, 0.3568628, 1, 1,
0.200438, 0.1041286, 2.194915, 0, 0.3529412, 1, 1,
0.2057868, -0.2561312, 3.572201, 0, 0.345098, 1, 1,
0.210113, -0.009035278, 1.191786, 0, 0.3411765, 1, 1,
0.2126939, -0.1577675, 2.174091, 0, 0.3333333, 1, 1,
0.2135786, 1.248175, -1.038651, 0, 0.3294118, 1, 1,
0.2195941, 1.792416, -0.6484524, 0, 0.3215686, 1, 1,
0.2201373, 0.8414098, 0.83206, 0, 0.3176471, 1, 1,
0.2221499, 0.2225095, 2.886114, 0, 0.3098039, 1, 1,
0.2228599, 1.788163, 1.170178, 0, 0.3058824, 1, 1,
0.2230823, -2.403982, 3.112829, 0, 0.2980392, 1, 1,
0.2242014, -0.5245061, 3.410284, 0, 0.2901961, 1, 1,
0.2242031, 0.9892552, -0.9982803, 0, 0.2862745, 1, 1,
0.2271307, 0.3828706, 1.249097, 0, 0.2784314, 1, 1,
0.228579, -2.323264, 2.593271, 0, 0.2745098, 1, 1,
0.2322689, -0.2908207, -0.3414187, 0, 0.2666667, 1, 1,
0.2349818, 1.026134, -0.2285306, 0, 0.2627451, 1, 1,
0.2352006, -0.04788296, 1.331378, 0, 0.254902, 1, 1,
0.2356539, -1.301987, 3.609602, 0, 0.2509804, 1, 1,
0.2487107, -0.4211209, 2.80661, 0, 0.2431373, 1, 1,
0.2497478, 0.9524913, 0.1081719, 0, 0.2392157, 1, 1,
0.2504177, 0.9537163, 1.43865, 0, 0.2313726, 1, 1,
0.2552607, -0.02364211, 3.129477, 0, 0.227451, 1, 1,
0.2620368, 0.6649155, -0.9794704, 0, 0.2196078, 1, 1,
0.2623319, 0.2693113, 1.110069, 0, 0.2156863, 1, 1,
0.2679435, -1.363423, 2.326225, 0, 0.2078431, 1, 1,
0.2681136, -0.3907234, 0.8044794, 0, 0.2039216, 1, 1,
0.2743072, 0.4048678, 2.545097, 0, 0.1960784, 1, 1,
0.2768562, 0.8710645, 1.619007, 0, 0.1882353, 1, 1,
0.2783888, -0.2236101, 3.726402, 0, 0.1843137, 1, 1,
0.2787735, -0.4392139, 1.742111, 0, 0.1764706, 1, 1,
0.2789375, 0.808892, 0.1386205, 0, 0.172549, 1, 1,
0.2791293, 0.1201314, 1.487492, 0, 0.1647059, 1, 1,
0.284813, 0.8825682, 0.009879011, 0, 0.1607843, 1, 1,
0.2936458, 0.6074531, 2.364932, 0, 0.1529412, 1, 1,
0.295891, -0.661443, 2.544502, 0, 0.1490196, 1, 1,
0.2965068, 0.7713174, 2.683465, 0, 0.1411765, 1, 1,
0.2979207, -1.623197, 1.938558, 0, 0.1372549, 1, 1,
0.3051116, 1.713603, 0.4721346, 0, 0.1294118, 1, 1,
0.3113935, -0.8148084, 2.533936, 0, 0.1254902, 1, 1,
0.312942, 0.7709625, 0.7733594, 0, 0.1176471, 1, 1,
0.3132235, -0.6839709, 2.564799, 0, 0.1137255, 1, 1,
0.315739, 1.316995, -0.3429472, 0, 0.1058824, 1, 1,
0.3223699, 0.04298101, 3.306692, 0, 0.09803922, 1, 1,
0.3233891, 1.821267, -1.455329, 0, 0.09411765, 1, 1,
0.3270247, 1.432952, -0.9687853, 0, 0.08627451, 1, 1,
0.3328706, -1.084021, 2.311918, 0, 0.08235294, 1, 1,
0.3334, 1.761579, -0.6397141, 0, 0.07450981, 1, 1,
0.3378901, 0.5589111, -0.9482307, 0, 0.07058824, 1, 1,
0.3423769, -0.2307289, 2.138869, 0, 0.0627451, 1, 1,
0.3437929, -0.2791918, 3.089641, 0, 0.05882353, 1, 1,
0.3463562, -0.09860178, 1.72649, 0, 0.05098039, 1, 1,
0.3500327, -0.5960253, 3.564946, 0, 0.04705882, 1, 1,
0.3508123, 1.600272, 0.2870634, 0, 0.03921569, 1, 1,
0.3511796, 1.064674, -0.7407619, 0, 0.03529412, 1, 1,
0.358023, -1.158489, 4.24931, 0, 0.02745098, 1, 1,
0.358245, -1.045105, 3.29855, 0, 0.02352941, 1, 1,
0.3601201, -0.4349255, 1.710699, 0, 0.01568628, 1, 1,
0.3635733, 1.072978, 0.5866424, 0, 0.01176471, 1, 1,
0.3647236, 1.600808, 0.6155486, 0, 0.003921569, 1, 1,
0.3673264, -1.942809, 3.041794, 0.003921569, 0, 1, 1,
0.3705883, 0.4494155, 2.439205, 0.007843138, 0, 1, 1,
0.3716362, -1.270395, 2.397557, 0.01568628, 0, 1, 1,
0.3755763, 1.206528, 1.636064, 0.01960784, 0, 1, 1,
0.3758679, -1.382982, 2.805954, 0.02745098, 0, 1, 1,
0.3772697, -0.1425671, -0.1929362, 0.03137255, 0, 1, 1,
0.3779937, -0.1689932, 2.24265, 0.03921569, 0, 1, 1,
0.3855964, 3.520406, -0.02026707, 0.04313726, 0, 1, 1,
0.3870528, 2.290834, 0.9852622, 0.05098039, 0, 1, 1,
0.3909756, 1.23185, 0.9428035, 0.05490196, 0, 1, 1,
0.3930478, -0.5785707, 1.941187, 0.0627451, 0, 1, 1,
0.3937866, -0.5834548, 1.632457, 0.06666667, 0, 1, 1,
0.3944181, -0.5602148, 2.326561, 0.07450981, 0, 1, 1,
0.396111, -0.2864917, 2.512215, 0.07843138, 0, 1, 1,
0.3999262, 0.7588734, -0.3643526, 0.08627451, 0, 1, 1,
0.4023331, 0.6104848, 0.297066, 0.09019608, 0, 1, 1,
0.4024237, -0.4126517, 3.780569, 0.09803922, 0, 1, 1,
0.4031169, 0.7150149, 0.4462169, 0.1058824, 0, 1, 1,
0.4067187, 0.1400997, 3.472379, 0.1098039, 0, 1, 1,
0.4118648, -1.031589, 3.725797, 0.1176471, 0, 1, 1,
0.4135385, -2.761654, 4.235142, 0.1215686, 0, 1, 1,
0.4232044, 0.2657311, 2.127721, 0.1294118, 0, 1, 1,
0.4269147, 0.5502657, 0.01960367, 0.1333333, 0, 1, 1,
0.429391, 0.9774795, 0.782202, 0.1411765, 0, 1, 1,
0.4307394, 0.3321036, 1.692847, 0.145098, 0, 1, 1,
0.4312874, -1.70081, 3.253388, 0.1529412, 0, 1, 1,
0.4324198, -0.3442328, 2.560648, 0.1568628, 0, 1, 1,
0.4330299, 0.0917929, 1.249793, 0.1647059, 0, 1, 1,
0.4342504, -0.8276185, 2.298038, 0.1686275, 0, 1, 1,
0.4417406, -0.4819601, 1.210999, 0.1764706, 0, 1, 1,
0.4423054, -1.326078, 2.273922, 0.1803922, 0, 1, 1,
0.4499253, 1.269004, -0.3198969, 0.1882353, 0, 1, 1,
0.4526823, -0.0579472, 0.6030013, 0.1921569, 0, 1, 1,
0.4532063, 0.04723827, 1.941266, 0.2, 0, 1, 1,
0.4606855, -1.203898, 1.040318, 0.2078431, 0, 1, 1,
0.4637834, 1.167701, 1.745402, 0.2117647, 0, 1, 1,
0.4639924, 2.050604, 0.845929, 0.2196078, 0, 1, 1,
0.466932, 0.3268883, 0.236838, 0.2235294, 0, 1, 1,
0.4693856, 1.1577, 0.1872102, 0.2313726, 0, 1, 1,
0.4729329, -1.429303, 4.286565, 0.2352941, 0, 1, 1,
0.4742241, -0.1386035, -1.137629, 0.2431373, 0, 1, 1,
0.4837596, -1.179818, 4.044345, 0.2470588, 0, 1, 1,
0.4842409, -1.470085, 3.357061, 0.254902, 0, 1, 1,
0.4944906, 0.2140789, 2.869453, 0.2588235, 0, 1, 1,
0.5019319, -1.34465, 2.723134, 0.2666667, 0, 1, 1,
0.5041755, -0.3251541, 1.626251, 0.2705882, 0, 1, 1,
0.5080765, -0.2834169, 2.344, 0.2784314, 0, 1, 1,
0.5150165, -0.5676692, 3.192336, 0.282353, 0, 1, 1,
0.5160964, -0.7532756, 1.768849, 0.2901961, 0, 1, 1,
0.519927, -0.3688563, 0.8791331, 0.2941177, 0, 1, 1,
0.5293219, 2.468349, 0.1389537, 0.3019608, 0, 1, 1,
0.5324859, 0.4830835, 0.8625365, 0.3098039, 0, 1, 1,
0.5330873, -1.508693, 4.08, 0.3137255, 0, 1, 1,
0.5342123, 0.3809867, 1.777614, 0.3215686, 0, 1, 1,
0.5370383, 0.0876188, 2.183006, 0.3254902, 0, 1, 1,
0.5406713, -0.888182, 2.624753, 0.3333333, 0, 1, 1,
0.5442299, 0.8004022, 1.701848, 0.3372549, 0, 1, 1,
0.5467464, 0.2829596, 2.342692, 0.345098, 0, 1, 1,
0.5468256, 0.8452935, 0.658656, 0.3490196, 0, 1, 1,
0.5518981, 1.325069, -0.1846263, 0.3568628, 0, 1, 1,
0.551918, 1.211947, -0.3234494, 0.3607843, 0, 1, 1,
0.5546005, 0.6630153, 0.6453522, 0.3686275, 0, 1, 1,
0.5568348, -1.249262, 3.744227, 0.372549, 0, 1, 1,
0.5582417, -0.7409382, 1.776711, 0.3803922, 0, 1, 1,
0.5642029, -0.8294239, 0.7228495, 0.3843137, 0, 1, 1,
0.5646077, 0.4147615, 0.7976415, 0.3921569, 0, 1, 1,
0.5668133, -0.00127651, 3.527442, 0.3960784, 0, 1, 1,
0.5692922, 1.327708, -0.03118972, 0.4039216, 0, 1, 1,
0.573519, -1.220764, 0.8844637, 0.4117647, 0, 1, 1,
0.5763915, 1.284024, 0.04891184, 0.4156863, 0, 1, 1,
0.5784636, 0.6871206, 0.6538129, 0.4235294, 0, 1, 1,
0.5836499, -0.1302671, 0.9506812, 0.427451, 0, 1, 1,
0.5865566, -0.2925033, 2.830548, 0.4352941, 0, 1, 1,
0.5883055, -0.7993311, 3.875198, 0.4392157, 0, 1, 1,
0.5912431, 0.2580964, -0.401475, 0.4470588, 0, 1, 1,
0.6007977, 0.2726631, -0.3085106, 0.4509804, 0, 1, 1,
0.6096618, 0.5269628, 1.451253, 0.4588235, 0, 1, 1,
0.6101487, -1.85614, 1.78551, 0.4627451, 0, 1, 1,
0.6110067, 0.7335056, -1.042065, 0.4705882, 0, 1, 1,
0.6146448, 1.436929, 1.353759, 0.4745098, 0, 1, 1,
0.6159746, -0.595009, 2.562817, 0.4823529, 0, 1, 1,
0.6175395, 0.3071307, 0.8918487, 0.4862745, 0, 1, 1,
0.6197491, -0.2266515, 2.593314, 0.4941176, 0, 1, 1,
0.620798, -1.350138, 3.744388, 0.5019608, 0, 1, 1,
0.6231443, -0.7102145, 0.6086101, 0.5058824, 0, 1, 1,
0.6248505, -2.031298, 2.858459, 0.5137255, 0, 1, 1,
0.6302601, -0.2201051, 2.052095, 0.5176471, 0, 1, 1,
0.6322492, -0.2398049, 2.455212, 0.5254902, 0, 1, 1,
0.633905, 0.9372341, 1.930761, 0.5294118, 0, 1, 1,
0.638343, 0.9914603, -0.03811988, 0.5372549, 0, 1, 1,
0.6400458, -0.9470139, 0.9881379, 0.5411765, 0, 1, 1,
0.6473798, 0.819912, 2.122711, 0.5490196, 0, 1, 1,
0.6520572, 1.466775, -0.6392956, 0.5529412, 0, 1, 1,
0.6626418, -0.1412111, 0.7241164, 0.5607843, 0, 1, 1,
0.6680174, 0.2612285, 0.5485014, 0.5647059, 0, 1, 1,
0.6698148, 1.357004, -0.3419624, 0.572549, 0, 1, 1,
0.6711512, 0.6839875, -0.573312, 0.5764706, 0, 1, 1,
0.6723938, -0.5837823, 3.258038, 0.5843138, 0, 1, 1,
0.6745696, 0.267306, 0.7234153, 0.5882353, 0, 1, 1,
0.6802198, -1.304531, 2.509155, 0.5960785, 0, 1, 1,
0.6853552, 1.006496, -0.0153007, 0.6039216, 0, 1, 1,
0.6856819, -0.4377759, 2.578559, 0.6078432, 0, 1, 1,
0.6860138, 0.7235091, 2.064939, 0.6156863, 0, 1, 1,
0.6911733, 0.2563322, 0.6523632, 0.6196079, 0, 1, 1,
0.7015827, -0.197668, 1.648763, 0.627451, 0, 1, 1,
0.704708, -0.3067942, 3.450722, 0.6313726, 0, 1, 1,
0.70837, -0.5368559, 0.5376842, 0.6392157, 0, 1, 1,
0.7129446, -1.936895, 3.824378, 0.6431373, 0, 1, 1,
0.7139164, -0.8355477, 1.09798, 0.6509804, 0, 1, 1,
0.7191136, 0.910118, 1.595632, 0.654902, 0, 1, 1,
0.7219823, -1.302294, 2.252959, 0.6627451, 0, 1, 1,
0.7234104, -0.05877154, 0.3171825, 0.6666667, 0, 1, 1,
0.7317041, 0.8757975, -0.2062966, 0.6745098, 0, 1, 1,
0.7351875, -0.02769483, 2.069168, 0.6784314, 0, 1, 1,
0.7356061, -0.4930989, 1.07814, 0.6862745, 0, 1, 1,
0.741926, 0.7720495, 0.5920745, 0.6901961, 0, 1, 1,
0.7419288, -0.6605638, 1.940098, 0.6980392, 0, 1, 1,
0.7466373, 0.5345159, 0.7413841, 0.7058824, 0, 1, 1,
0.7475544, -0.1181093, 3.07417, 0.7098039, 0, 1, 1,
0.7585237, 0.1121007, 2.913681, 0.7176471, 0, 1, 1,
0.7593536, 1.028037, 1.414921, 0.7215686, 0, 1, 1,
0.7643749, -0.2630826, 2.977982, 0.7294118, 0, 1, 1,
0.7660062, 0.6118761, -1.864391, 0.7333333, 0, 1, 1,
0.767234, 0.1135071, 0.1909381, 0.7411765, 0, 1, 1,
0.7836157, -0.2271746, 0.8994762, 0.7450981, 0, 1, 1,
0.7905681, -1.746128, 2.739241, 0.7529412, 0, 1, 1,
0.7940471, 0.3287239, 0.6462934, 0.7568628, 0, 1, 1,
0.7997557, 0.6384529, 0.8906111, 0.7647059, 0, 1, 1,
0.8013095, 2.447689, 0.8153812, 0.7686275, 0, 1, 1,
0.804197, -1.478412, 0.8152514, 0.7764706, 0, 1, 1,
0.8072384, 1.594453, 2.092132, 0.7803922, 0, 1, 1,
0.8177972, -0.609917, 2.178607, 0.7882353, 0, 1, 1,
0.818449, -0.746905, 2.60463, 0.7921569, 0, 1, 1,
0.826298, -0.272598, 1.91524, 0.8, 0, 1, 1,
0.826602, -2.617687, 1.74947, 0.8078431, 0, 1, 1,
0.8278127, -0.10373, 1.207497, 0.8117647, 0, 1, 1,
0.8314229, -0.5642018, 4.442585, 0.8196079, 0, 1, 1,
0.8326833, -0.8609728, 1.322938, 0.8235294, 0, 1, 1,
0.8355646, -0.9726169, 2.834502, 0.8313726, 0, 1, 1,
0.836758, -0.3321093, -0.2427588, 0.8352941, 0, 1, 1,
0.8382063, 0.3403457, 1.50102, 0.8431373, 0, 1, 1,
0.8414999, 0.5674095, -1.039631, 0.8470588, 0, 1, 1,
0.8416623, -1.220877, 1.893742, 0.854902, 0, 1, 1,
0.8422451, -0.2096511, 0.6642432, 0.8588235, 0, 1, 1,
0.8427445, -0.8775821, 2.702306, 0.8666667, 0, 1, 1,
0.8458946, -1.517421, 3.027278, 0.8705882, 0, 1, 1,
0.8475017, -0.2915297, 1.823133, 0.8784314, 0, 1, 1,
0.8505338, -0.5252628, 0.7184305, 0.8823529, 0, 1, 1,
0.8566544, -0.2856833, 2.994966, 0.8901961, 0, 1, 1,
0.8574106, 1.38233, 1.029463, 0.8941177, 0, 1, 1,
0.8612226, 0.7252488, -0.3703463, 0.9019608, 0, 1, 1,
0.864481, 1.210922, -0.3881539, 0.9098039, 0, 1, 1,
0.8679535, -0.6914034, 1.587356, 0.9137255, 0, 1, 1,
0.8695394, -0.3816823, 1.206536, 0.9215686, 0, 1, 1,
0.8765173, -0.1789002, 1.229595, 0.9254902, 0, 1, 1,
0.8810006, 0.4030993, 1.839585, 0.9333333, 0, 1, 1,
0.8834289, 0.9483204, 1.355293, 0.9372549, 0, 1, 1,
0.897012, -0.1415785, 1.376457, 0.945098, 0, 1, 1,
0.9002748, 0.749974, 0.748517, 0.9490196, 0, 1, 1,
0.9009442, -0.3823913, 1.660907, 0.9568627, 0, 1, 1,
0.9061311, 0.6498001, -0.07510617, 0.9607843, 0, 1, 1,
0.9069379, 0.8494538, -0.8864117, 0.9686275, 0, 1, 1,
0.9146735, -0.742224, 1.486644, 0.972549, 0, 1, 1,
0.9166144, -0.570593, 1.461326, 0.9803922, 0, 1, 1,
0.9194157, 0.6323788, 1.991615, 0.9843137, 0, 1, 1,
0.9213497, 1.44008, -0.2106839, 0.9921569, 0, 1, 1,
0.9224519, 1.217958, 0.331009, 0.9960784, 0, 1, 1,
0.9231636, -0.2512639, 2.625162, 1, 0, 0.9960784, 1,
0.9245965, 1.093526, -1.898341, 1, 0, 0.9882353, 1,
0.927204, -0.9346286, 3.169935, 1, 0, 0.9843137, 1,
0.9273388, -1.31117, 1.188845, 1, 0, 0.9764706, 1,
0.9399126, 1.950984, -0.4692853, 1, 0, 0.972549, 1,
0.9414825, 1.387608, -0.9926509, 1, 0, 0.9647059, 1,
0.9420108, 2.106859, 1.108153, 1, 0, 0.9607843, 1,
0.9490653, -0.4353815, 1.410511, 1, 0, 0.9529412, 1,
0.9501674, -1.098428, 0.6828091, 1, 0, 0.9490196, 1,
0.950377, -1.167994, 1.70714, 1, 0, 0.9411765, 1,
0.9574033, -0.06134537, 0.6765732, 1, 0, 0.9372549, 1,
0.9599684, 0.5028209, 0.854039, 1, 0, 0.9294118, 1,
0.9632556, 0.7340089, 0.945599, 1, 0, 0.9254902, 1,
0.9713867, -1.168816, 1.206191, 1, 0, 0.9176471, 1,
0.9716637, 1.1663, 1.424317, 1, 0, 0.9137255, 1,
0.9817191, -2.701758, 2.420877, 1, 0, 0.9058824, 1,
0.9860821, 0.4159278, -1.178387, 1, 0, 0.9019608, 1,
0.9944401, -1.129009, 3.282547, 1, 0, 0.8941177, 1,
0.9988634, -0.8588628, 3.736244, 1, 0, 0.8862745, 1,
1.001129, 0.340191, 0.9764814, 1, 0, 0.8823529, 1,
1.001131, -0.2880518, 0.06863631, 1, 0, 0.8745098, 1,
1.003748, 0.9030221, 1.182049, 1, 0, 0.8705882, 1,
1.007494, 0.04266987, -0.1390761, 1, 0, 0.8627451, 1,
1.008586, 0.05810518, 1.331573, 1, 0, 0.8588235, 1,
1.030475, 1.083204, 1.561206, 1, 0, 0.8509804, 1,
1.030745, -0.3718446, 2.830404, 1, 0, 0.8470588, 1,
1.035698, 0.5896277, 0.420206, 1, 0, 0.8392157, 1,
1.037898, -0.5512957, 0.4159145, 1, 0, 0.8352941, 1,
1.039746, 1.855383, 2.253225, 1, 0, 0.827451, 1,
1.047017, 1.79236, 1.455313, 1, 0, 0.8235294, 1,
1.060422, -1.768872, 3.826606, 1, 0, 0.8156863, 1,
1.076703, 0.7087761, 2.691955, 1, 0, 0.8117647, 1,
1.077829, -1.047551, 2.496611, 1, 0, 0.8039216, 1,
1.079915, 2.878514, -0.101145, 1, 0, 0.7960784, 1,
1.086416, -3.153423, 1.969855, 1, 0, 0.7921569, 1,
1.088435, 1.022802, 0.3144067, 1, 0, 0.7843137, 1,
1.111111, 1.671039, 0.882113, 1, 0, 0.7803922, 1,
1.111148, 2.729291, -1.309309, 1, 0, 0.772549, 1,
1.112932, 0.06138822, 0.770674, 1, 0, 0.7686275, 1,
1.113419, -0.4563283, 2.986574, 1, 0, 0.7607843, 1,
1.133868, 0.03787773, 1.727554, 1, 0, 0.7568628, 1,
1.141411, 0.7993087, 0.8119771, 1, 0, 0.7490196, 1,
1.150136, 0.09223136, 1.870035, 1, 0, 0.7450981, 1,
1.156973, 0.8108912, 2.762334, 1, 0, 0.7372549, 1,
1.16369, 0.8167887, 0.4844369, 1, 0, 0.7333333, 1,
1.165073, 1.788679, -0.3608765, 1, 0, 0.7254902, 1,
1.171731, -0.5575491, 3.535539, 1, 0, 0.7215686, 1,
1.1742, 0.3483109, 2.128719, 1, 0, 0.7137255, 1,
1.178074, 1.403498, 0.4021732, 1, 0, 0.7098039, 1,
1.189561, -1.755715, 5.17115, 1, 0, 0.7019608, 1,
1.191407, 0.8426129, 0.8108084, 1, 0, 0.6941177, 1,
1.198758, -0.2145059, 0.9755803, 1, 0, 0.6901961, 1,
1.204048, 1.45241, -0.567341, 1, 0, 0.682353, 1,
1.204689, -0.6045348, 1.100718, 1, 0, 0.6784314, 1,
1.207104, 0.1278189, 3.14554, 1, 0, 0.6705883, 1,
1.209044, 0.1789045, 1.831927, 1, 0, 0.6666667, 1,
1.216529, 1.113943, 2.045728, 1, 0, 0.6588235, 1,
1.225361, -0.003400227, 0.8649502, 1, 0, 0.654902, 1,
1.226175, 0.7928055, 2.294116, 1, 0, 0.6470588, 1,
1.230049, -1.290547, 1.002314, 1, 0, 0.6431373, 1,
1.240297, 0.3996696, 0.9618655, 1, 0, 0.6352941, 1,
1.241628, -0.4527732, 3.153418, 1, 0, 0.6313726, 1,
1.245584, 0.2305413, 1.865698, 1, 0, 0.6235294, 1,
1.24781, -0.02390443, 2.213891, 1, 0, 0.6196079, 1,
1.248159, -0.3886534, 1.087639, 1, 0, 0.6117647, 1,
1.248585, -0.7754273, 3.316269, 1, 0, 0.6078432, 1,
1.252574, -0.006516749, 1.484238, 1, 0, 0.6, 1,
1.252999, 0.1874225, 2.165393, 1, 0, 0.5921569, 1,
1.266606, -0.06467821, 2.112904, 1, 0, 0.5882353, 1,
1.275946, -0.8942545, 2.865134, 1, 0, 0.5803922, 1,
1.276345, 0.6258531, 4.847071, 1, 0, 0.5764706, 1,
1.283392, 0.1787591, 0.4483303, 1, 0, 0.5686275, 1,
1.289207, -1.114499, 2.445072, 1, 0, 0.5647059, 1,
1.305423, 0.04207195, 2.055748, 1, 0, 0.5568628, 1,
1.310784, -0.3077511, 2.166654, 1, 0, 0.5529412, 1,
1.315308, 0.1720565, 2.158905, 1, 0, 0.5450981, 1,
1.316303, 1.16705, -0.3073961, 1, 0, 0.5411765, 1,
1.333609, 0.01027426, 1.125701, 1, 0, 0.5333334, 1,
1.336832, 1.143121, -0.2317181, 1, 0, 0.5294118, 1,
1.340471, 0.7104173, 2.201291, 1, 0, 0.5215687, 1,
1.348106, -0.01850622, 0.5816984, 1, 0, 0.5176471, 1,
1.359322, 0.3818204, 0.4148153, 1, 0, 0.509804, 1,
1.36863, 1.537665, -0.1246202, 1, 0, 0.5058824, 1,
1.379399, -1.089074, 1.820421, 1, 0, 0.4980392, 1,
1.382559, -1.714041, 1.979104, 1, 0, 0.4901961, 1,
1.385035, -0.7121362, 3.495698, 1, 0, 0.4862745, 1,
1.388095, -2.923908, 3.439849, 1, 0, 0.4784314, 1,
1.393217, -0.3016457, 2.368827, 1, 0, 0.4745098, 1,
1.39355, 0.2122008, 0.5325457, 1, 0, 0.4666667, 1,
1.425339, -0.440105, 2.012962, 1, 0, 0.4627451, 1,
1.449069, 0.3936736, 0.7108141, 1, 0, 0.454902, 1,
1.454767, 0.8306705, 0.8620297, 1, 0, 0.4509804, 1,
1.457569, 0.4610995, 2.349689, 1, 0, 0.4431373, 1,
1.464187, 2.249614, -0.8322365, 1, 0, 0.4392157, 1,
1.470187, 0.08771998, -0.7991369, 1, 0, 0.4313726, 1,
1.474376, -1.993929, 3.892846, 1, 0, 0.427451, 1,
1.478214, -1.024801, 1.619513, 1, 0, 0.4196078, 1,
1.48465, 0.6430103, 3.575718, 1, 0, 0.4156863, 1,
1.491045, 0.01976821, 1.974662, 1, 0, 0.4078431, 1,
1.491887, -0.6607124, 0.5707781, 1, 0, 0.4039216, 1,
1.492399, -0.3453295, 2.539535, 1, 0, 0.3960784, 1,
1.499061, 0.9944989, 2.258035, 1, 0, 0.3882353, 1,
1.499075, -0.7348197, 2.0431, 1, 0, 0.3843137, 1,
1.505449, -0.3455235, 1.45169, 1, 0, 0.3764706, 1,
1.535278, 0.3374505, 1.455333, 1, 0, 0.372549, 1,
1.551389, 1.044862, 1.423894, 1, 0, 0.3647059, 1,
1.56541, 0.6484854, 1.242785, 1, 0, 0.3607843, 1,
1.566393, -0.4092221, 3.399373, 1, 0, 0.3529412, 1,
1.571566, -0.8784714, 2.547835, 1, 0, 0.3490196, 1,
1.573473, -0.279332, 0.9463236, 1, 0, 0.3411765, 1,
1.577498, -0.6975344, 0.4149888, 1, 0, 0.3372549, 1,
1.60019, 0.5117232, 4.553109, 1, 0, 0.3294118, 1,
1.606885, -0.5610551, 1.369227, 1, 0, 0.3254902, 1,
1.611388, 0.5639414, 0.2151659, 1, 0, 0.3176471, 1,
1.644046, 1.39099, -1.235231, 1, 0, 0.3137255, 1,
1.652098, 2.376236, 1.031365, 1, 0, 0.3058824, 1,
1.683908, 0.6566044, 1.543858, 1, 0, 0.2980392, 1,
1.693986, 0.4222142, 2.538623, 1, 0, 0.2941177, 1,
1.705058, -2.612336, 1.903125, 1, 0, 0.2862745, 1,
1.714699, 0.05767838, 2.240682, 1, 0, 0.282353, 1,
1.718613, -0.6937763, 3.094636, 1, 0, 0.2745098, 1,
1.718986, -0.4622518, 2.332672, 1, 0, 0.2705882, 1,
1.721762, 0.01358912, 1.235928, 1, 0, 0.2627451, 1,
1.734173, 0.1383351, 3.928182, 1, 0, 0.2588235, 1,
1.734807, -1.27691, 1.533305, 1, 0, 0.2509804, 1,
1.735498, 1.150178, -0.6062988, 1, 0, 0.2470588, 1,
1.739334, 0.8932747, -0.02838167, 1, 0, 0.2392157, 1,
1.748359, 0.5778, 2.09876, 1, 0, 0.2352941, 1,
1.750161, 0.4897248, 0.963469, 1, 0, 0.227451, 1,
1.754859, -0.9271569, 2.004196, 1, 0, 0.2235294, 1,
1.764459, 1.125639, 1.320449, 1, 0, 0.2156863, 1,
1.7734, -0.3647482, 1.099883, 1, 0, 0.2117647, 1,
1.789471, -0.2905463, -0.07466366, 1, 0, 0.2039216, 1,
1.802108, 0.5585439, 2.872118, 1, 0, 0.1960784, 1,
1.829787, -0.7438033, 2.46435, 1, 0, 0.1921569, 1,
1.838086, 0.02228401, 2.509344, 1, 0, 0.1843137, 1,
1.884324, 0.7980094, 1.241315, 1, 0, 0.1803922, 1,
1.897019, 0.9534133, -0.7465479, 1, 0, 0.172549, 1,
1.907493, 0.4118614, 2.146693, 1, 0, 0.1686275, 1,
1.921928, -0.3546789, 2.182342, 1, 0, 0.1607843, 1,
1.925624, -0.1197811, 1.553527, 1, 0, 0.1568628, 1,
1.935523, -1.603325, 3.39556, 1, 0, 0.1490196, 1,
1.946196, -0.489156, 2.951097, 1, 0, 0.145098, 1,
1.974969, 0.1184403, 1.992211, 1, 0, 0.1372549, 1,
2.027029, -0.001597702, 0.977267, 1, 0, 0.1333333, 1,
2.034861, 0.5864729, 0.5244258, 1, 0, 0.1254902, 1,
2.107088, -0.8425899, 0.6682942, 1, 0, 0.1215686, 1,
2.113491, 0.6194764, 0.8637405, 1, 0, 0.1137255, 1,
2.176463, -0.7194631, 1.646901, 1, 0, 0.1098039, 1,
2.250226, 0.2563452, 0.932044, 1, 0, 0.1019608, 1,
2.259337, -0.13143, 2.196231, 1, 0, 0.09411765, 1,
2.315274, 2.866657, 2.347698, 1, 0, 0.09019608, 1,
2.349836, 0.2251749, 0.2276295, 1, 0, 0.08235294, 1,
2.359764, -0.9801906, 1.042196, 1, 0, 0.07843138, 1,
2.383667, 0.04729881, 3.508582, 1, 0, 0.07058824, 1,
2.389046, 0.7943999, 0.07379621, 1, 0, 0.06666667, 1,
2.412462, -0.7093284, 2.281351, 1, 0, 0.05882353, 1,
2.444086, 0.1271061, 3.766489, 1, 0, 0.05490196, 1,
2.460418, 1.205385, 1.212611, 1, 0, 0.04705882, 1,
2.571269, -0.03570447, 1.433805, 1, 0, 0.04313726, 1,
2.589835, 1.123693, 0.9393126, 1, 0, 0.03529412, 1,
2.63871, -0.5455905, 0.5548562, 1, 0, 0.03137255, 1,
2.707824, 0.4636361, 1.818188, 1, 0, 0.02352941, 1,
2.708218, 1.547198, 1.002009, 1, 0, 0.01960784, 1,
2.721733, -0.007363108, -0.8397567, 1, 0, 0.01176471, 1,
2.754321, 0.5472489, 0.4012125, 1, 0, 0.007843138, 1
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
0.1299278, -4.284637, -8.075607, 0, -0.5, 0.5, 0.5,
0.1299278, -4.284637, -8.075607, 1, -0.5, 0.5, 0.5,
0.1299278, -4.284637, -8.075607, 1, 1.5, 0.5, 0.5,
0.1299278, -4.284637, -8.075607, 0, 1.5, 0.5, 0.5
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
-3.384135, 0.1834915, -8.075607, 0, -0.5, 0.5, 0.5,
-3.384135, 0.1834915, -8.075607, 1, -0.5, 0.5, 0.5,
-3.384135, 0.1834915, -8.075607, 1, 1.5, 0.5, 0.5,
-3.384135, 0.1834915, -8.075607, 0, 1.5, 0.5, 0.5
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
-3.384135, -4.284637, -0.4922779, 0, -0.5, 0.5, 0.5,
-3.384135, -4.284637, -0.4922779, 1, -0.5, 0.5, 0.5,
-3.384135, -4.284637, -0.4922779, 1, 1.5, 0.5, 0.5,
-3.384135, -4.284637, -0.4922779, 0, 1.5, 0.5, 0.5
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
-2, -3.253531, -6.325608,
2, -3.253531, -6.325608,
-2, -3.253531, -6.325608,
-2, -3.425382, -6.617275,
-1, -3.253531, -6.325608,
-1, -3.425382, -6.617275,
0, -3.253531, -6.325608,
0, -3.425382, -6.617275,
1, -3.253531, -6.325608,
1, -3.425382, -6.617275,
2, -3.253531, -6.325608,
2, -3.425382, -6.617275
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
-2, -3.769084, -7.200608, 0, -0.5, 0.5, 0.5,
-2, -3.769084, -7.200608, 1, -0.5, 0.5, 0.5,
-2, -3.769084, -7.200608, 1, 1.5, 0.5, 0.5,
-2, -3.769084, -7.200608, 0, 1.5, 0.5, 0.5,
-1, -3.769084, -7.200608, 0, -0.5, 0.5, 0.5,
-1, -3.769084, -7.200608, 1, -0.5, 0.5, 0.5,
-1, -3.769084, -7.200608, 1, 1.5, 0.5, 0.5,
-1, -3.769084, -7.200608, 0, 1.5, 0.5, 0.5,
0, -3.769084, -7.200608, 0, -0.5, 0.5, 0.5,
0, -3.769084, -7.200608, 1, -0.5, 0.5, 0.5,
0, -3.769084, -7.200608, 1, 1.5, 0.5, 0.5,
0, -3.769084, -7.200608, 0, 1.5, 0.5, 0.5,
1, -3.769084, -7.200608, 0, -0.5, 0.5, 0.5,
1, -3.769084, -7.200608, 1, -0.5, 0.5, 0.5,
1, -3.769084, -7.200608, 1, 1.5, 0.5, 0.5,
1, -3.769084, -7.200608, 0, 1.5, 0.5, 0.5,
2, -3.769084, -7.200608, 0, -0.5, 0.5, 0.5,
2, -3.769084, -7.200608, 1, -0.5, 0.5, 0.5,
2, -3.769084, -7.200608, 1, 1.5, 0.5, 0.5,
2, -3.769084, -7.200608, 0, 1.5, 0.5, 0.5
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
-2.573197, -3, -6.325608,
-2.573197, 3, -6.325608,
-2.573197, -3, -6.325608,
-2.708353, -3, -6.617275,
-2.573197, -2, -6.325608,
-2.708353, -2, -6.617275,
-2.573197, -1, -6.325608,
-2.708353, -1, -6.617275,
-2.573197, 0, -6.325608,
-2.708353, 0, -6.617275,
-2.573197, 1, -6.325608,
-2.708353, 1, -6.617275,
-2.573197, 2, -6.325608,
-2.708353, 2, -6.617275,
-2.573197, 3, -6.325608,
-2.708353, 3, -6.617275
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
-2.978666, -3, -7.200608, 0, -0.5, 0.5, 0.5,
-2.978666, -3, -7.200608, 1, -0.5, 0.5, 0.5,
-2.978666, -3, -7.200608, 1, 1.5, 0.5, 0.5,
-2.978666, -3, -7.200608, 0, 1.5, 0.5, 0.5,
-2.978666, -2, -7.200608, 0, -0.5, 0.5, 0.5,
-2.978666, -2, -7.200608, 1, -0.5, 0.5, 0.5,
-2.978666, -2, -7.200608, 1, 1.5, 0.5, 0.5,
-2.978666, -2, -7.200608, 0, 1.5, 0.5, 0.5,
-2.978666, -1, -7.200608, 0, -0.5, 0.5, 0.5,
-2.978666, -1, -7.200608, 1, -0.5, 0.5, 0.5,
-2.978666, -1, -7.200608, 1, 1.5, 0.5, 0.5,
-2.978666, -1, -7.200608, 0, 1.5, 0.5, 0.5,
-2.978666, 0, -7.200608, 0, -0.5, 0.5, 0.5,
-2.978666, 0, -7.200608, 1, -0.5, 0.5, 0.5,
-2.978666, 0, -7.200608, 1, 1.5, 0.5, 0.5,
-2.978666, 0, -7.200608, 0, 1.5, 0.5, 0.5,
-2.978666, 1, -7.200608, 0, -0.5, 0.5, 0.5,
-2.978666, 1, -7.200608, 1, -0.5, 0.5, 0.5,
-2.978666, 1, -7.200608, 1, 1.5, 0.5, 0.5,
-2.978666, 1, -7.200608, 0, 1.5, 0.5, 0.5,
-2.978666, 2, -7.200608, 0, -0.5, 0.5, 0.5,
-2.978666, 2, -7.200608, 1, -0.5, 0.5, 0.5,
-2.978666, 2, -7.200608, 1, 1.5, 0.5, 0.5,
-2.978666, 2, -7.200608, 0, 1.5, 0.5, 0.5,
-2.978666, 3, -7.200608, 0, -0.5, 0.5, 0.5,
-2.978666, 3, -7.200608, 1, -0.5, 0.5, 0.5,
-2.978666, 3, -7.200608, 1, 1.5, 0.5, 0.5,
-2.978666, 3, -7.200608, 0, 1.5, 0.5, 0.5
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
-2.573197, -3.253531, -6,
-2.573197, -3.253531, 4,
-2.573197, -3.253531, -6,
-2.708353, -3.425382, -6,
-2.573197, -3.253531, -4,
-2.708353, -3.425382, -4,
-2.573197, -3.253531, -2,
-2.708353, -3.425382, -2,
-2.573197, -3.253531, 0,
-2.708353, -3.425382, 0,
-2.573197, -3.253531, 2,
-2.708353, -3.425382, 2,
-2.573197, -3.253531, 4,
-2.708353, -3.425382, 4
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
-2.978666, -3.769084, -6, 0, -0.5, 0.5, 0.5,
-2.978666, -3.769084, -6, 1, -0.5, 0.5, 0.5,
-2.978666, -3.769084, -6, 1, 1.5, 0.5, 0.5,
-2.978666, -3.769084, -6, 0, 1.5, 0.5, 0.5,
-2.978666, -3.769084, -4, 0, -0.5, 0.5, 0.5,
-2.978666, -3.769084, -4, 1, -0.5, 0.5, 0.5,
-2.978666, -3.769084, -4, 1, 1.5, 0.5, 0.5,
-2.978666, -3.769084, -4, 0, 1.5, 0.5, 0.5,
-2.978666, -3.769084, -2, 0, -0.5, 0.5, 0.5,
-2.978666, -3.769084, -2, 1, -0.5, 0.5, 0.5,
-2.978666, -3.769084, -2, 1, 1.5, 0.5, 0.5,
-2.978666, -3.769084, -2, 0, 1.5, 0.5, 0.5,
-2.978666, -3.769084, 0, 0, -0.5, 0.5, 0.5,
-2.978666, -3.769084, 0, 1, -0.5, 0.5, 0.5,
-2.978666, -3.769084, 0, 1, 1.5, 0.5, 0.5,
-2.978666, -3.769084, 0, 0, 1.5, 0.5, 0.5,
-2.978666, -3.769084, 2, 0, -0.5, 0.5, 0.5,
-2.978666, -3.769084, 2, 1, -0.5, 0.5, 0.5,
-2.978666, -3.769084, 2, 1, 1.5, 0.5, 0.5,
-2.978666, -3.769084, 2, 0, 1.5, 0.5, 0.5,
-2.978666, -3.769084, 4, 0, -0.5, 0.5, 0.5,
-2.978666, -3.769084, 4, 1, -0.5, 0.5, 0.5,
-2.978666, -3.769084, 4, 1, 1.5, 0.5, 0.5,
-2.978666, -3.769084, 4, 0, 1.5, 0.5, 0.5
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
-2.573197, -3.253531, -6.325608,
-2.573197, 3.620513, -6.325608,
-2.573197, -3.253531, 5.341053,
-2.573197, 3.620513, 5.341053,
-2.573197, -3.253531, -6.325608,
-2.573197, -3.253531, 5.341053,
-2.573197, 3.620513, -6.325608,
-2.573197, 3.620513, 5.341053,
-2.573197, -3.253531, -6.325608,
2.833053, -3.253531, -6.325608,
-2.573197, -3.253531, 5.341053,
2.833053, -3.253531, 5.341053,
-2.573197, 3.620513, -6.325608,
2.833053, 3.620513, -6.325608,
-2.573197, 3.620513, 5.341053,
2.833053, 3.620513, 5.341053,
2.833053, -3.253531, -6.325608,
2.833053, 3.620513, -6.325608,
2.833053, -3.253531, 5.341053,
2.833053, 3.620513, 5.341053,
2.833053, -3.253531, -6.325608,
2.833053, -3.253531, 5.341053,
2.833053, 3.620513, -6.325608,
2.833053, 3.620513, 5.341053
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
var radius = 7.785704;
var distance = 34.63948;
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
mvMatrix.translate( -0.1299278, -0.1834915, 0.4922779 );
mvMatrix.scale( 1.557097, 1.224615, 0.721548 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63948);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
tralomethrin<-read.table("tralomethrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tralomethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'tralomethrin' not found
```

```r
y<-tralomethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'tralomethrin' not found
```

```r
z<-tralomethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'tralomethrin' not found
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
-2.494465, -0.7812589, -3.678838, 0, 0, 1, 1, 1,
-2.42837, 1.354051, -0.261334, 1, 0, 0, 1, 1,
-2.399954, -0.9849151, -1.356239, 1, 0, 0, 1, 1,
-2.215083, 0.2200558, -1.844714, 1, 0, 0, 1, 1,
-2.21471, 1.678264, -1.661675, 1, 0, 0, 1, 1,
-2.211575, 0.4028407, -2.068454, 1, 0, 0, 1, 1,
-2.125809, 0.5824383, -1.088812, 0, 0, 0, 1, 1,
-2.109422, -1.712855, -1.163796, 0, 0, 0, 1, 1,
-2.073022, 0.03107882, -1.066584, 0, 0, 0, 1, 1,
-2.019688, 0.1972768, -1.043452, 0, 0, 0, 1, 1,
-2.01166, -0.9767376, -3.250031, 0, 0, 0, 1, 1,
-2.0087, 0.5794224, -0.4218268, 0, 0, 0, 1, 1,
-1.989554, 0.6442131, 0.2678858, 0, 0, 0, 1, 1,
-1.985802, 0.8389388, -1.26852, 1, 1, 1, 1, 1,
-1.977459, -0.01086567, 0.01448776, 1, 1, 1, 1, 1,
-1.96113, 0.9355203, -2.123911, 1, 1, 1, 1, 1,
-1.924888, 0.7232387, -0.4691879, 1, 1, 1, 1, 1,
-1.921268, -0.3954083, -1.713801, 1, 1, 1, 1, 1,
-1.897418, -1.017073, -1.429952, 1, 1, 1, 1, 1,
-1.873539, -1.911753, -4.13667, 1, 1, 1, 1, 1,
-1.849329, -0.8253465, -0.9732947, 1, 1, 1, 1, 1,
-1.845743, 0.1292196, -1.635229, 1, 1, 1, 1, 1,
-1.84251, -0.8879891, -1.453073, 1, 1, 1, 1, 1,
-1.828022, -0.3152657, -1.67456, 1, 1, 1, 1, 1,
-1.827679, -0.5471382, -3.145641, 1, 1, 1, 1, 1,
-1.823096, -0.5216647, -0.8021749, 1, 1, 1, 1, 1,
-1.819731, -0.4316822, -2.711534, 1, 1, 1, 1, 1,
-1.818103, 0.4272666, -1.078983, 1, 1, 1, 1, 1,
-1.814003, 0.1168684, -1.115859, 0, 0, 1, 1, 1,
-1.810096, -0.2785011, -3.094461, 1, 0, 0, 1, 1,
-1.806813, -0.1300963, -0.2978968, 1, 0, 0, 1, 1,
-1.80233, -0.6295201, -2.723629, 1, 0, 0, 1, 1,
-1.79916, 1.623079, -0.8170565, 1, 0, 0, 1, 1,
-1.777059, -0.8361977, -3.895668, 1, 0, 0, 1, 1,
-1.768141, -0.1390434, -1.516565, 0, 0, 0, 1, 1,
-1.726563, 0.9557461, -1.973619, 0, 0, 0, 1, 1,
-1.72191, -0.7797601, -1.057167, 0, 0, 0, 1, 1,
-1.720195, 1.141568, -0.8989175, 0, 0, 0, 1, 1,
-1.710061, -2.478711, -3.238418, 0, 0, 0, 1, 1,
-1.688911, 0.1203859, -2.65251, 0, 0, 0, 1, 1,
-1.676115, -0.5637222, 0.09846208, 0, 0, 0, 1, 1,
-1.657144, -0.4815105, -0.6803881, 1, 1, 1, 1, 1,
-1.654034, -0.3558851, -1.999417, 1, 1, 1, 1, 1,
-1.647834, 0.6968006, 0.9595501, 1, 1, 1, 1, 1,
-1.637096, -1.277049, -3.531531, 1, 1, 1, 1, 1,
-1.621199, 0.8421624, -1.108261, 1, 1, 1, 1, 1,
-1.618306, -1.187848, -2.200453, 1, 1, 1, 1, 1,
-1.594438, 1.934292, 1.433981, 1, 1, 1, 1, 1,
-1.583802, -0.7049273, -1.750445, 1, 1, 1, 1, 1,
-1.570836, -1.238945, -1.390402, 1, 1, 1, 1, 1,
-1.565175, -0.128703, -2.002099, 1, 1, 1, 1, 1,
-1.562219, -0.1731507, -1.497543, 1, 1, 1, 1, 1,
-1.560695, 0.1915604, -1.910705, 1, 1, 1, 1, 1,
-1.558399, 0.4670067, -0.910301, 1, 1, 1, 1, 1,
-1.531408, 1.016881, 0.1973946, 1, 1, 1, 1, 1,
-1.524701, -0.4405128, -1.887712, 1, 1, 1, 1, 1,
-1.518516, 2.096527, 0.5064929, 0, 0, 1, 1, 1,
-1.517755, 0.9801157, -2.471049, 1, 0, 0, 1, 1,
-1.513539, -0.5410939, -2.206928, 1, 0, 0, 1, 1,
-1.507813, -0.008047361, -2.502685, 1, 0, 0, 1, 1,
-1.499758, 0.389184, -1.089666, 1, 0, 0, 1, 1,
-1.498788, 0.6193517, -3.134993, 1, 0, 0, 1, 1,
-1.490221, -0.4964852, -2.290664, 0, 0, 0, 1, 1,
-1.489831, 1.852312, -0.9680092, 0, 0, 0, 1, 1,
-1.489712, 1.400308, -1.073392, 0, 0, 0, 1, 1,
-1.483672, -1.582725, -1.193355, 0, 0, 0, 1, 1,
-1.451274, -0.8518942, -0.1205064, 0, 0, 0, 1, 1,
-1.422312, 0.5340537, -1.161507, 0, 0, 0, 1, 1,
-1.422218, 0.7513304, -2.603619, 0, 0, 0, 1, 1,
-1.408126, 1.17198, -1.256242, 1, 1, 1, 1, 1,
-1.405936, 1.107579, -2.986011, 1, 1, 1, 1, 1,
-1.405934, 0.3380778, -2.029419, 1, 1, 1, 1, 1,
-1.401006, 0.06559485, -0.4677925, 1, 1, 1, 1, 1,
-1.389262, -0.2070132, -1.264112, 1, 1, 1, 1, 1,
-1.371083, -0.757327, -1.256711, 1, 1, 1, 1, 1,
-1.359026, -1.320853, -4.479352, 1, 1, 1, 1, 1,
-1.353067, -0.4798297, 1.005031, 1, 1, 1, 1, 1,
-1.352872, 0.2722133, -1.087741, 1, 1, 1, 1, 1,
-1.348665, -0.001070261, -2.057518, 1, 1, 1, 1, 1,
-1.343344, 0.7317126, -0.5051498, 1, 1, 1, 1, 1,
-1.340443, 1.068202, -2.187859, 1, 1, 1, 1, 1,
-1.340028, -0.8461353, -2.111869, 1, 1, 1, 1, 1,
-1.334504, 0.1697438, -1.045626, 1, 1, 1, 1, 1,
-1.333264, -1.721909, -2.654004, 1, 1, 1, 1, 1,
-1.331602, 2.249959, -1.137146, 0, 0, 1, 1, 1,
-1.329766, 0.600153, -0.6687502, 1, 0, 0, 1, 1,
-1.329412, 1.978654, -0.5743376, 1, 0, 0, 1, 1,
-1.3214, 0.9429033, -1.853676, 1, 0, 0, 1, 1,
-1.320637, 0.9437835, -1.12169, 1, 0, 0, 1, 1,
-1.320029, 1.306378, 0.4171187, 1, 0, 0, 1, 1,
-1.305477, -0.4396819, -1.218772, 0, 0, 0, 1, 1,
-1.29485, -0.3406214, -0.3307931, 0, 0, 0, 1, 1,
-1.289978, 1.04776, 0.3487956, 0, 0, 0, 1, 1,
-1.289031, 1.826484, -0.6837541, 0, 0, 0, 1, 1,
-1.283261, 0.1893948, -0.3013982, 0, 0, 0, 1, 1,
-1.264958, 0.9147305, -1.275431, 0, 0, 0, 1, 1,
-1.256732, -1.150124, -3.696317, 0, 0, 0, 1, 1,
-1.255796, -0.5142847, -2.65826, 1, 1, 1, 1, 1,
-1.251496, 0.003822884, -2.655136, 1, 1, 1, 1, 1,
-1.25018, -0.07013643, -2.162786, 1, 1, 1, 1, 1,
-1.240732, 1.166313, 1.131698, 1, 1, 1, 1, 1,
-1.230581, -1.850517, -3.270729, 1, 1, 1, 1, 1,
-1.229958, 0.07037748, -2.413012, 1, 1, 1, 1, 1,
-1.214462, -1.098621, -3.374748, 1, 1, 1, 1, 1,
-1.213567, 0.463246, -0.6365196, 1, 1, 1, 1, 1,
-1.20233, 1.562937, -0.778424, 1, 1, 1, 1, 1,
-1.198469, -0.5931986, -4.64896, 1, 1, 1, 1, 1,
-1.193849, -0.4453878, -2.671288, 1, 1, 1, 1, 1,
-1.188881, -0.01063182, -0.5053458, 1, 1, 1, 1, 1,
-1.184752, 0.4175507, -1.80449, 1, 1, 1, 1, 1,
-1.18387, -0.04028267, -0.3637271, 1, 1, 1, 1, 1,
-1.175876, 0.2647372, -1.30196, 1, 1, 1, 1, 1,
-1.175868, 0.7589897, -1.652056, 0, 0, 1, 1, 1,
-1.161251, -0.2685009, -3.49571, 1, 0, 0, 1, 1,
-1.159161, -0.1111459, -1.490325, 1, 0, 0, 1, 1,
-1.152737, 0.4608421, -1.176872, 1, 0, 0, 1, 1,
-1.139654, -0.1353235, -1.757057, 1, 0, 0, 1, 1,
-1.139245, 0.6452485, 0.356531, 1, 0, 0, 1, 1,
-1.138185, 1.854166, -2.145005, 0, 0, 0, 1, 1,
-1.131639, -0.7083737, -2.466646, 0, 0, 0, 1, 1,
-1.128164, 1.025569, -3.227329, 0, 0, 0, 1, 1,
-1.12115, -0.0693341, -1.503749, 0, 0, 0, 1, 1,
-1.119778, -0.4292598, -2.364058, 0, 0, 0, 1, 1,
-1.117658, -0.9675984, -2.273024, 0, 0, 0, 1, 1,
-1.106122, 0.08894563, -1.113428, 0, 0, 0, 1, 1,
-1.099125, -0.2033926, -1.357122, 1, 1, 1, 1, 1,
-1.097842, -1.168469, -2.202381, 1, 1, 1, 1, 1,
-1.094172, -0.4181295, -0.3435871, 1, 1, 1, 1, 1,
-1.088102, 2.030038, -0.7197263, 1, 1, 1, 1, 1,
-1.082688, -0.07302837, -3.027576, 1, 1, 1, 1, 1,
-1.080636, -1.854477, -1.757734, 1, 1, 1, 1, 1,
-1.079093, 0.4874478, -0.5435802, 1, 1, 1, 1, 1,
-1.077173, 1.162803, 0.04389675, 1, 1, 1, 1, 1,
-1.069081, 0.7820208, -0.8050299, 1, 1, 1, 1, 1,
-1.067884, 1.014424, -0.5605183, 1, 1, 1, 1, 1,
-1.06417, 0.9089419, -2.699451, 1, 1, 1, 1, 1,
-1.055935, -0.2108647, -2.525926, 1, 1, 1, 1, 1,
-1.055004, -0.396353, -0.5961073, 1, 1, 1, 1, 1,
-1.052735, -1.19438, -2.259242, 1, 1, 1, 1, 1,
-1.049636, -0.9331256, -1.65484, 1, 1, 1, 1, 1,
-1.046351, -1.354481, -2.390783, 0, 0, 1, 1, 1,
-1.041375, 0.8606685, -0.936516, 1, 0, 0, 1, 1,
-1.035433, 0.6659231, -0.3561103, 1, 0, 0, 1, 1,
-1.033942, -1.116196, -2.68631, 1, 0, 0, 1, 1,
-1.033542, 0.1389664, -2.989013, 1, 0, 0, 1, 1,
-1.031694, 0.3104185, 0.4484728, 1, 0, 0, 1, 1,
-1.031682, -0.454601, -1.972611, 0, 0, 0, 1, 1,
-1.030593, -0.2767511, -1.658837, 0, 0, 0, 1, 1,
-1.02826, 2.042403, -0.6315325, 0, 0, 0, 1, 1,
-1.027821, 0.8327725, -1.49331, 0, 0, 0, 1, 1,
-1.026143, -0.353086, -0.1826894, 0, 0, 0, 1, 1,
-1.020352, -0.8240241, -2.90872, 0, 0, 0, 1, 1,
-1.017444, 0.2565101, -1.444815, 0, 0, 0, 1, 1,
-1.017194, 1.419889, -1.369399, 1, 1, 1, 1, 1,
-1.015255, 1.167152, -0.2796994, 1, 1, 1, 1, 1,
-1.013178, 0.5096951, -1.313135, 1, 1, 1, 1, 1,
-1.012995, -0.8360788, -1.505433, 1, 1, 1, 1, 1,
-1.008114, 0.1576936, -2.099245, 1, 1, 1, 1, 1,
-1.007673, -2.310863, -3.048882, 1, 1, 1, 1, 1,
-1.006919, 0.5724767, -1.891495, 1, 1, 1, 1, 1,
-1.00431, -0.296912, -1.212015, 1, 1, 1, 1, 1,
-1.002221, 1.550908, -0.4324693, 1, 1, 1, 1, 1,
-1.00187, -1.466641, -4.244607, 1, 1, 1, 1, 1,
-1.001205, 0.04141317, -3.131484, 1, 1, 1, 1, 1,
-0.9996856, -3.109195, -3.918965, 1, 1, 1, 1, 1,
-0.992157, 0.3994702, -1.422728, 1, 1, 1, 1, 1,
-0.9917322, 0.3188069, -0.8602088, 1, 1, 1, 1, 1,
-0.9908496, -1.476074, -2.904275, 1, 1, 1, 1, 1,
-0.9906054, -0.4043754, -2.623108, 0, 0, 1, 1, 1,
-0.9896552, 0.5985572, -0.2594813, 1, 0, 0, 1, 1,
-0.9868163, 1.400274, 0.215196, 1, 0, 0, 1, 1,
-0.9813091, -1.03531, -1.674031, 1, 0, 0, 1, 1,
-0.9770066, 0.9314176, 0.2478246, 1, 0, 0, 1, 1,
-0.9706801, 0.4325751, -2.299946, 1, 0, 0, 1, 1,
-0.9646684, 0.1671676, -2.498518, 0, 0, 0, 1, 1,
-0.9587534, 0.5416462, -1.264793, 0, 0, 0, 1, 1,
-0.9573708, 0.5873132, 0.5305361, 0, 0, 0, 1, 1,
-0.9572246, -0.5421805, -1.798823, 0, 0, 0, 1, 1,
-0.9564142, -0.7279184, 0.05024036, 0, 0, 0, 1, 1,
-0.9544579, 0.3196453, -0.756856, 0, 0, 0, 1, 1,
-0.9537981, 0.4805916, -0.5103124, 0, 0, 0, 1, 1,
-0.9526225, -0.3761992, -1.565123, 1, 1, 1, 1, 1,
-0.951139, -0.6778479, -2.259821, 1, 1, 1, 1, 1,
-0.9509017, -0.783114, -3.073913, 1, 1, 1, 1, 1,
-0.9481921, -1.802048, -3.461736, 1, 1, 1, 1, 1,
-0.9481539, -0.8196676, -1.104714, 1, 1, 1, 1, 1,
-0.9473336, 0.6283664, -0.9820576, 1, 1, 1, 1, 1,
-0.9457409, -0.2242491, -3.267074, 1, 1, 1, 1, 1,
-0.9316175, -0.280199, -2.587689, 1, 1, 1, 1, 1,
-0.9296499, 0.4610183, -0.6489601, 1, 1, 1, 1, 1,
-0.9289171, -0.008778384, -0.2356462, 1, 1, 1, 1, 1,
-0.9287062, 0.7020671, -0.7830561, 1, 1, 1, 1, 1,
-0.9257431, -0.7189296, -2.050791, 1, 1, 1, 1, 1,
-0.9235013, -0.1935739, -2.217195, 1, 1, 1, 1, 1,
-0.9225669, 1.395029, 1.934404, 1, 1, 1, 1, 1,
-0.9155475, -0.05491204, -3.250492, 1, 1, 1, 1, 1,
-0.9118362, 0.9736369, -2.536751, 0, 0, 1, 1, 1,
-0.9089008, -1.268206, -2.21301, 1, 0, 0, 1, 1,
-0.8996681, 1.122746, -2.019017, 1, 0, 0, 1, 1,
-0.8948748, 0.4408452, -1.274422, 1, 0, 0, 1, 1,
-0.8917226, -1.170791, -1.411944, 1, 0, 0, 1, 1,
-0.8904662, -0.2811339, -0.06598764, 1, 0, 0, 1, 1,
-0.8903078, 0.5339349, -1.161458, 0, 0, 0, 1, 1,
-0.8889461, -0.5774074, -1.778128, 0, 0, 0, 1, 1,
-0.8889412, -0.4138603, -0.05975862, 0, 0, 0, 1, 1,
-0.8873292, 1.147397, -1.125715, 0, 0, 0, 1, 1,
-0.8845246, 0.7820652, -2.269431, 0, 0, 0, 1, 1,
-0.877587, 0.4605606, -2.642771, 0, 0, 0, 1, 1,
-0.8767352, -1.821571, -0.4473773, 0, 0, 0, 1, 1,
-0.874159, 0.91709, -1.183638, 1, 1, 1, 1, 1,
-0.870599, 0.3615668, -0.8659124, 1, 1, 1, 1, 1,
-0.8643134, -1.034858, -3.573809, 1, 1, 1, 1, 1,
-0.8587393, 0.4572462, -0.7188735, 1, 1, 1, 1, 1,
-0.8580073, 0.913156, -0.9017849, 1, 1, 1, 1, 1,
-0.8573068, -0.06178212, 0.9428533, 1, 1, 1, 1, 1,
-0.8466101, -0.6057659, -2.173526, 1, 1, 1, 1, 1,
-0.8458893, -1.043322, -2.056689, 1, 1, 1, 1, 1,
-0.8413752, -0.1346939, -1.862365, 1, 1, 1, 1, 1,
-0.8395427, -0.06720201, -2.755808, 1, 1, 1, 1, 1,
-0.8345101, 0.4399839, -1.706042, 1, 1, 1, 1, 1,
-0.8340986, 1.092476, 0.3502752, 1, 1, 1, 1, 1,
-0.8311977, -1.071709, -0.7291747, 1, 1, 1, 1, 1,
-0.8303565, 0.3443387, -2.216559, 1, 1, 1, 1, 1,
-0.8298846, 0.1175905, -2.177298, 1, 1, 1, 1, 1,
-0.8298403, -0.002179581, -1.827177, 0, 0, 1, 1, 1,
-0.8275242, -1.726308, -3.295468, 1, 0, 0, 1, 1,
-0.8267093, -0.7004384, -2.611553, 1, 0, 0, 1, 1,
-0.820462, -0.03139554, -1.138601, 1, 0, 0, 1, 1,
-0.8195128, -1.325092, -3.330853, 1, 0, 0, 1, 1,
-0.8178395, 0.4514091, -0.9797369, 1, 0, 0, 1, 1,
-0.8138887, 0.1208777, -1.653208, 0, 0, 0, 1, 1,
-0.8075689, 0.07563084, -0.9706118, 0, 0, 0, 1, 1,
-0.8067161, -0.6527568, -2.296125, 0, 0, 0, 1, 1,
-0.8034228, 0.518217, -2.07528, 0, 0, 0, 1, 1,
-0.800438, -1.555371, -6.155705, 0, 0, 0, 1, 1,
-0.8003565, 1.150814, -0.7757682, 0, 0, 0, 1, 1,
-0.7959468, -1.363406, -1.589868, 0, 0, 0, 1, 1,
-0.7952451, 2.049533, -2.118671, 1, 1, 1, 1, 1,
-0.7947992, -0.8250827, -2.98936, 1, 1, 1, 1, 1,
-0.7933373, 0.8696769, -2.012119, 1, 1, 1, 1, 1,
-0.7902378, 0.2849469, 0.1581614, 1, 1, 1, 1, 1,
-0.7853035, 0.2949692, -0.4389285, 1, 1, 1, 1, 1,
-0.778401, -0.07838701, -1.993829, 1, 1, 1, 1, 1,
-0.7775518, -1.003339, -3.010998, 1, 1, 1, 1, 1,
-0.7757013, 0.3784937, -0.1970185, 1, 1, 1, 1, 1,
-0.7741004, -1.603271, -2.403643, 1, 1, 1, 1, 1,
-0.7735738, -0.5275772, -3.261384, 1, 1, 1, 1, 1,
-0.769877, 0.5900155, -2.770478, 1, 1, 1, 1, 1,
-0.7690327, -1.029491, -1.314303, 1, 1, 1, 1, 1,
-0.7662077, -1.689631, -3.87631, 1, 1, 1, 1, 1,
-0.7631752, 0.3388326, -1.10457, 1, 1, 1, 1, 1,
-0.7586098, -2.040061, -3.145729, 1, 1, 1, 1, 1,
-0.7552271, -1.851194, -3.893784, 0, 0, 1, 1, 1,
-0.7541448, -1.337603, -3.686729, 1, 0, 0, 1, 1,
-0.7528142, -1.409173, -2.03124, 1, 0, 0, 1, 1,
-0.7522442, -0.4352317, -1.646791, 1, 0, 0, 1, 1,
-0.7501592, -1.199327, -3.821065, 1, 0, 0, 1, 1,
-0.7453487, 1.583007, 0.8886913, 1, 0, 0, 1, 1,
-0.7440554, -0.6257356, -1.877104, 0, 0, 0, 1, 1,
-0.7433597, 1.163049, 0.3217484, 0, 0, 0, 1, 1,
-0.7341568, -0.5693809, -1.573814, 0, 0, 0, 1, 1,
-0.732919, 2.506671, 0.5228942, 0, 0, 0, 1, 1,
-0.7288786, -0.3600365, -2.154026, 0, 0, 0, 1, 1,
-0.7258268, -0.8457131, -0.7329344, 0, 0, 0, 1, 1,
-0.7252586, -0.5946522, -1.847414, 0, 0, 0, 1, 1,
-0.724811, -1.336423, -1.465849, 1, 1, 1, 1, 1,
-0.7134228, -1.220559, -3.340972, 1, 1, 1, 1, 1,
-0.7089868, -1.105261, -2.0654, 1, 1, 1, 1, 1,
-0.706274, -0.4062474, -1.53739, 1, 1, 1, 1, 1,
-0.7019379, 0.0560446, -3.184731, 1, 1, 1, 1, 1,
-0.6997216, -0.8503618, -2.74358, 1, 1, 1, 1, 1,
-0.6984996, -0.4581097, -2.589772, 1, 1, 1, 1, 1,
-0.6954334, 0.5580505, -0.550765, 1, 1, 1, 1, 1,
-0.6906345, 0.3676475, -1.303427, 1, 1, 1, 1, 1,
-0.6889625, -2.161079, -1.967479, 1, 1, 1, 1, 1,
-0.6886003, -0.3473396, -2.758911, 1, 1, 1, 1, 1,
-0.6862558, -0.2768428, -2.310828, 1, 1, 1, 1, 1,
-0.6767809, -1.211934, -3.662042, 1, 1, 1, 1, 1,
-0.6762163, 0.0798733, -3.443264, 1, 1, 1, 1, 1,
-0.6759337, 1.13665, 2.324414, 1, 1, 1, 1, 1,
-0.6756425, 0.06730065, -1.832832, 0, 0, 1, 1, 1,
-0.674999, -0.746325, -1.612927, 1, 0, 0, 1, 1,
-0.6733051, -1.31515, -2.434687, 1, 0, 0, 1, 1,
-0.6730129, -0.01706953, -2.667601, 1, 0, 0, 1, 1,
-0.6685886, 0.9372059, -1.338903, 1, 0, 0, 1, 1,
-0.6635337, 0.7439305, -1.490132, 1, 0, 0, 1, 1,
-0.660125, 0.9894006, -0.05836633, 0, 0, 0, 1, 1,
-0.6589318, 0.6455237, -0.1832425, 0, 0, 0, 1, 1,
-0.6581208, 0.8936996, -0.9788111, 0, 0, 0, 1, 1,
-0.6567979, -0.9319414, -4.033812, 0, 0, 0, 1, 1,
-0.6564829, -0.8907468, -2.188944, 0, 0, 0, 1, 1,
-0.6553807, -0.2172969, -2.703359, 0, 0, 0, 1, 1,
-0.6539745, 1.162554, 0.03248609, 0, 0, 0, 1, 1,
-0.6530822, 0.7966229, -1.253049, 1, 1, 1, 1, 1,
-0.649536, 0.0626407, -1.512442, 1, 1, 1, 1, 1,
-0.6444553, -1.192551, -4.249261, 1, 1, 1, 1, 1,
-0.6433184, 0.5038226, -0.55916, 1, 1, 1, 1, 1,
-0.6412303, -1.627674, -1.677626, 1, 1, 1, 1, 1,
-0.6411778, 0.736008, -1.700375, 1, 1, 1, 1, 1,
-0.6400302, -0.8943193, -1.822584, 1, 1, 1, 1, 1,
-0.6398812, 0.9963701, 0.5662239, 1, 1, 1, 1, 1,
-0.6338375, -1.054611, -2.865473, 1, 1, 1, 1, 1,
-0.6294816, 0.1361413, -1.684552, 1, 1, 1, 1, 1,
-0.6286502, 0.728442, 0.0356821, 1, 1, 1, 1, 1,
-0.6232885, -0.1903879, -0.9589991, 1, 1, 1, 1, 1,
-0.6209789, 1.569999, -1.657205, 1, 1, 1, 1, 1,
-0.6105514, 0.1822037, -0.8015811, 1, 1, 1, 1, 1,
-0.6056519, 0.6292853, -2.597121, 1, 1, 1, 1, 1,
-0.6053582, -0.2465457, -0.9676763, 0, 0, 1, 1, 1,
-0.599824, -1.232196, -2.454004, 1, 0, 0, 1, 1,
-0.5968255, -0.8972217, -2.490607, 1, 0, 0, 1, 1,
-0.5786228, -0.6965367, -1.580357, 1, 0, 0, 1, 1,
-0.5740902, 0.1235382, -1.49757, 1, 0, 0, 1, 1,
-0.566438, 0.605181, -1.533102, 1, 0, 0, 1, 1,
-0.5635782, 0.1685571, -1.71245, 0, 0, 0, 1, 1,
-0.5620983, -0.8993407, -2.309581, 0, 0, 0, 1, 1,
-0.5618702, 0.2093856, -0.8912439, 0, 0, 0, 1, 1,
-0.5609729, -0.8660249, -2.692393, 0, 0, 0, 1, 1,
-0.5602081, 0.6156638, -0.8187305, 0, 0, 0, 1, 1,
-0.5548946, -1.308893, -2.242367, 0, 0, 0, 1, 1,
-0.5463096, 1.103497, 0.3026166, 0, 0, 0, 1, 1,
-0.5435098, -0.4882065, -3.980678, 1, 1, 1, 1, 1,
-0.5433949, -0.121956, -3.91355, 1, 1, 1, 1, 1,
-0.5423759, 1.829757, 0.4674855, 1, 1, 1, 1, 1,
-0.5414639, -0.01775699, -2.382413, 1, 1, 1, 1, 1,
-0.5390531, 1.297881, -2.361536, 1, 1, 1, 1, 1,
-0.5382633, -1.531793, -2.44869, 1, 1, 1, 1, 1,
-0.5329619, -0.384577, -3.075104, 1, 1, 1, 1, 1,
-0.5301477, 1.935957, 0.4436408, 1, 1, 1, 1, 1,
-0.5254232, -1.390504, -2.720549, 1, 1, 1, 1, 1,
-0.5225967, -0.1645674, -1.615879, 1, 1, 1, 1, 1,
-0.5154881, -0.6362488, -3.655077, 1, 1, 1, 1, 1,
-0.5149884, -1.860359, -4.362909, 1, 1, 1, 1, 1,
-0.5148519, -1.175747, -2.54034, 1, 1, 1, 1, 1,
-0.5090562, -0.3791607, -0.3035273, 1, 1, 1, 1, 1,
-0.5083854, 0.2288481, -2.904976, 1, 1, 1, 1, 1,
-0.5082934, -0.9213974, -3.6667, 0, 0, 1, 1, 1,
-0.5074555, 0.2708994, -0.8541722, 1, 0, 0, 1, 1,
-0.5029031, 0.611397, -1.676667, 1, 0, 0, 1, 1,
-0.5019593, 0.5332649, 0.274927, 1, 0, 0, 1, 1,
-0.4985416, -0.2521185, -3.046313, 1, 0, 0, 1, 1,
-0.4968586, 2.555349, 0.5900344, 1, 0, 0, 1, 1,
-0.4884226, 1.023767, -1.299673, 0, 0, 0, 1, 1,
-0.4874891, 1.460821, 0.1978622, 0, 0, 0, 1, 1,
-0.4849078, 1.670204, -1.831433, 0, 0, 0, 1, 1,
-0.4815307, -0.5624486, -3.2496, 0, 0, 0, 1, 1,
-0.4772177, 2.46072, 0.2322655, 0, 0, 0, 1, 1,
-0.4696954, 1.110084, -0.08950314, 0, 0, 0, 1, 1,
-0.4691828, 0.007854127, -2.975044, 0, 0, 0, 1, 1,
-0.4666789, -0.6270404, -3.117555, 1, 1, 1, 1, 1,
-0.4657744, -0.1764275, 0.03006139, 1, 1, 1, 1, 1,
-0.4648499, 0.2040863, -1.14716, 1, 1, 1, 1, 1,
-0.4619076, 0.1885998, -2.358797, 1, 1, 1, 1, 1,
-0.4618381, -1.028662, -3.221537, 1, 1, 1, 1, 1,
-0.4569272, -0.431191, -2.892553, 1, 1, 1, 1, 1,
-0.4567441, 0.6456094, 1.972907, 1, 1, 1, 1, 1,
-0.453172, 0.4814738, -1.46773, 1, 1, 1, 1, 1,
-0.4517311, -0.34493, -2.055742, 1, 1, 1, 1, 1,
-0.4502482, 0.4383991, -1.602606, 1, 1, 1, 1, 1,
-0.4488769, 0.8961145, 0.9126878, 1, 1, 1, 1, 1,
-0.4448912, 0.7120308, -0.02934107, 1, 1, 1, 1, 1,
-0.4434965, 1.263411, 0.9870417, 1, 1, 1, 1, 1,
-0.4395716, -0.4080071, -2.225877, 1, 1, 1, 1, 1,
-0.4394461, 0.6502681, 1.077743, 1, 1, 1, 1, 1,
-0.4372816, 0.1489253, -0.8430377, 0, 0, 1, 1, 1,
-0.436745, 0.9659536, 0.2500266, 1, 0, 0, 1, 1,
-0.4350874, -0.313246, -4.173271, 1, 0, 0, 1, 1,
-0.4341511, -0.4343421, -1.021107, 1, 0, 0, 1, 1,
-0.4330222, 0.565282, -2.417238, 1, 0, 0, 1, 1,
-0.431134, 0.7522362, -0.9516565, 1, 0, 0, 1, 1,
-0.4307896, 1.001435, 0.5112812, 0, 0, 0, 1, 1,
-0.430456, -0.3679194, -2.657123, 0, 0, 0, 1, 1,
-0.429796, 0.5805032, 0.3473991, 0, 0, 0, 1, 1,
-0.4277067, 0.1437152, -0.9662465, 0, 0, 0, 1, 1,
-0.4276369, -0.1102801, -1.235598, 0, 0, 0, 1, 1,
-0.4197461, -0.3601967, -3.25999, 0, 0, 0, 1, 1,
-0.4183778, 0.5392188, -1.453561, 0, 0, 0, 1, 1,
-0.4140041, 1.033262, -0.3215621, 1, 1, 1, 1, 1,
-0.4111546, 0.8001831, -0.02172626, 1, 1, 1, 1, 1,
-0.4090945, -0.01839171, -0.7665386, 1, 1, 1, 1, 1,
-0.4077969, 0.09934323, -1.33285, 1, 1, 1, 1, 1,
-0.4069302, 0.4796786, -2.823756, 1, 1, 1, 1, 1,
-0.4010879, -0.737078, -3.745677, 1, 1, 1, 1, 1,
-0.3974937, -0.2829785, -3.772282, 1, 1, 1, 1, 1,
-0.3959204, -0.3581633, -2.195592, 1, 1, 1, 1, 1,
-0.3846997, 0.2079401, -0.6065046, 1, 1, 1, 1, 1,
-0.3838102, -0.4414479, -2.185912, 1, 1, 1, 1, 1,
-0.3808773, -0.1091011, -0.4765641, 1, 1, 1, 1, 1,
-0.3609881, -1.154424, -2.061816, 1, 1, 1, 1, 1,
-0.3604699, 0.4769664, -0.512159, 1, 1, 1, 1, 1,
-0.3591004, -2.474422, -2.965124, 1, 1, 1, 1, 1,
-0.3576692, -0.868744, -1.395185, 1, 1, 1, 1, 1,
-0.3539833, 0.3280417, -1.691972, 0, 0, 1, 1, 1,
-0.3496817, -0.04504052, -2.174364, 1, 0, 0, 1, 1,
-0.3473128, 2.352234, 1.317699, 1, 0, 0, 1, 1,
-0.3454704, 0.3002781, 0.09280465, 1, 0, 0, 1, 1,
-0.3423775, 0.3010266, -0.6959359, 1, 0, 0, 1, 1,
-0.3413749, -0.2499698, -2.822158, 1, 0, 0, 1, 1,
-0.3403352, -1.391804, -2.449511, 0, 0, 0, 1, 1,
-0.3364087, -0.7900176, -2.352448, 0, 0, 0, 1, 1,
-0.3317058, -1.625601, -2.347591, 0, 0, 0, 1, 1,
-0.3300966, 1.532788, -1.189851, 0, 0, 0, 1, 1,
-0.320646, -1.130036, -3.471086, 0, 0, 0, 1, 1,
-0.3105696, -1.110047, -1.597459, 0, 0, 0, 1, 1,
-0.3089794, -0.6313136, -2.264205, 0, 0, 0, 1, 1,
-0.3087162, -1.234816, -2.319396, 1, 1, 1, 1, 1,
-0.3033959, -1.474577, -2.207515, 1, 1, 1, 1, 1,
-0.3026612, -0.3416947, -3.004042, 1, 1, 1, 1, 1,
-0.2989756, 0.1222593, -1.410384, 1, 1, 1, 1, 1,
-0.2989688, 0.02859778, -1.474178, 1, 1, 1, 1, 1,
-0.2984463, -0.07453753, -1.910468, 1, 1, 1, 1, 1,
-0.2983697, -1.453453, -3.025491, 1, 1, 1, 1, 1,
-0.2956006, -0.4312247, -2.181845, 1, 1, 1, 1, 1,
-0.2952536, -0.4376695, -2.101578, 1, 1, 1, 1, 1,
-0.2899544, 0.5324252, -0.3199456, 1, 1, 1, 1, 1,
-0.2896191, 0.3626397, -0.402579, 1, 1, 1, 1, 1,
-0.2849403, -1.16488, -2.578863, 1, 1, 1, 1, 1,
-0.2842726, -1.239151, -3.680388, 1, 1, 1, 1, 1,
-0.2742948, 0.44427, 0.0862252, 1, 1, 1, 1, 1,
-0.2738267, -1.860776, -4.739417, 1, 1, 1, 1, 1,
-0.272979, -0.5048775, -1.132455, 0, 0, 1, 1, 1,
-0.2718088, -0.5551237, -3.161052, 1, 0, 0, 1, 1,
-0.2707086, 0.6834332, -0.2267286, 1, 0, 0, 1, 1,
-0.2665257, 0.8135996, -2.06393, 1, 0, 0, 1, 1,
-0.2659545, -0.6818572, -0.9693258, 1, 0, 0, 1, 1,
-0.2643981, -0.5495126, -2.634927, 1, 0, 0, 1, 1,
-0.2547362, -1.061039, -4.179076, 0, 0, 0, 1, 1,
-0.2542432, 0.8519018, -1.35956, 0, 0, 0, 1, 1,
-0.251148, -0.9963319, -1.546348, 0, 0, 0, 1, 1,
-0.2491306, 0.0578048, -1.115308, 0, 0, 0, 1, 1,
-0.2476933, 0.4378453, -1.766618, 0, 0, 0, 1, 1,
-0.2424105, -2.097711, -2.36158, 0, 0, 0, 1, 1,
-0.2421912, 0.8935351, -0.35316, 0, 0, 0, 1, 1,
-0.2411022, -1.863987, -4.665441, 1, 1, 1, 1, 1,
-0.2338126, -0.7387238, -3.114208, 1, 1, 1, 1, 1,
-0.230867, 1.589798, 0.5058894, 1, 1, 1, 1, 1,
-0.2302222, -1.293067, -2.734784, 1, 1, 1, 1, 1,
-0.2295824, -1.791305, -2.891289, 1, 1, 1, 1, 1,
-0.229161, -1.162438, -4.247748, 1, 1, 1, 1, 1,
-0.2261467, 0.2566455, -1.771064, 1, 1, 1, 1, 1,
-0.2254276, 0.09666505, -0.9256913, 1, 1, 1, 1, 1,
-0.2246185, 0.6157273, -0.6538395, 1, 1, 1, 1, 1,
-0.2232376, 0.0952038, -0.9284993, 1, 1, 1, 1, 1,
-0.2227701, -0.1274506, -3.765385, 1, 1, 1, 1, 1,
-0.2214594, -1.71731, -3.372661, 1, 1, 1, 1, 1,
-0.2211948, 1.216533, 0.1419312, 1, 1, 1, 1, 1,
-0.215461, 0.8398311, -1.137217, 1, 1, 1, 1, 1,
-0.2148967, -0.6072679, -1.518116, 1, 1, 1, 1, 1,
-0.2133259, 0.09815182, -1.030563, 0, 0, 1, 1, 1,
-0.2122142, 0.4447893, -0.5861785, 1, 0, 0, 1, 1,
-0.2119343, 0.2942944, -0.6297268, 1, 0, 0, 1, 1,
-0.2085025, 0.3068745, -0.1976343, 1, 0, 0, 1, 1,
-0.207782, -0.26471, -4.079731, 1, 0, 0, 1, 1,
-0.2060554, -0.256804, -1.507826, 1, 0, 0, 1, 1,
-0.2028884, -1.184697, -2.067214, 0, 0, 0, 1, 1,
-0.2016616, -0.4464369, -2.695896, 0, 0, 0, 1, 1,
-0.1968281, 0.8717391, -0.2171859, 0, 0, 0, 1, 1,
-0.1932486, 1.338898, -1.404952, 0, 0, 0, 1, 1,
-0.1871008, -0.2042081, -0.6483732, 0, 0, 0, 1, 1,
-0.1865986, 0.6390232, 1.083987, 0, 0, 0, 1, 1,
-0.1835631, 1.984194, -0.6786342, 0, 0, 0, 1, 1,
-0.1817372, -0.9018428, -3.133362, 1, 1, 1, 1, 1,
-0.1800109, 0.5085899, 0.6667392, 1, 1, 1, 1, 1,
-0.1747285, -1.098742, -2.022725, 1, 1, 1, 1, 1,
-0.1717904, 1.268341, 1.164928, 1, 1, 1, 1, 1,
-0.1679122, -0.2836031, -1.62912, 1, 1, 1, 1, 1,
-0.1658819, -0.2616922, -1.707034, 1, 1, 1, 1, 1,
-0.1654691, -0.1782153, -1.751264, 1, 1, 1, 1, 1,
-0.1524752, 1.208901, -0.270012, 1, 1, 1, 1, 1,
-0.1483915, -0.1386751, -1.459345, 1, 1, 1, 1, 1,
-0.1463359, 1.481645, 0.902715, 1, 1, 1, 1, 1,
-0.1446756, 1.158846, -1.666473, 1, 1, 1, 1, 1,
-0.14027, 0.373277, 0.9544953, 1, 1, 1, 1, 1,
-0.1371323, 1.801606, -1.658062, 1, 1, 1, 1, 1,
-0.135492, -0.9022482, -1.834317, 1, 1, 1, 1, 1,
-0.1291113, 1.818234, -1.311355, 1, 1, 1, 1, 1,
-0.1279099, -1.081169, -2.537687, 0, 0, 1, 1, 1,
-0.126192, 0.6976167, 0.1789558, 1, 0, 0, 1, 1,
-0.1239641, 0.8672607, 0.05390967, 1, 0, 0, 1, 1,
-0.1236734, 1.474646, -1.065359, 1, 0, 0, 1, 1,
-0.1188348, -0.2986766, -3.860807, 1, 0, 0, 1, 1,
-0.1161999, -0.6177412, -2.541885, 1, 0, 0, 1, 1,
-0.1146736, -0.9342654, -4.514813, 0, 0, 0, 1, 1,
-0.1127904, 1.208441, -0.7390893, 0, 0, 0, 1, 1,
-0.1117833, 0.9322082, 0.1166673, 0, 0, 0, 1, 1,
-0.1109336, 0.5130914, -0.7977774, 0, 0, 0, 1, 1,
-0.1102287, -1.348855, -5.132767, 0, 0, 0, 1, 1,
-0.1081702, 0.6345941, -0.6319876, 0, 0, 0, 1, 1,
-0.1020817, 0.4185458, 0.7773286, 0, 0, 0, 1, 1,
-0.09910198, -0.1298205, -1.232918, 1, 1, 1, 1, 1,
-0.09894766, -0.139114, -4.104448, 1, 1, 1, 1, 1,
-0.09199294, -0.6968099, -4.662799, 1, 1, 1, 1, 1,
-0.09183935, -0.1834706, -3.346579, 1, 1, 1, 1, 1,
-0.09069329, -0.7681618, -1.457565, 1, 1, 1, 1, 1,
-0.09063698, 1.063181, -0.3377931, 1, 1, 1, 1, 1,
-0.08521757, 0.07493051, -0.9606538, 1, 1, 1, 1, 1,
-0.08083992, -0.7861636, -2.625193, 1, 1, 1, 1, 1,
-0.07654473, -0.4222827, -3.386009, 1, 1, 1, 1, 1,
-0.07555207, 0.7637873, 0.4412599, 1, 1, 1, 1, 1,
-0.07419399, 0.1382248, -0.914842, 1, 1, 1, 1, 1,
-0.07319135, 0.4267347, -0.8126007, 1, 1, 1, 1, 1,
-0.06960437, 0.1691922, -0.5801765, 1, 1, 1, 1, 1,
-0.06767938, -2.033311, -3.491095, 1, 1, 1, 1, 1,
-0.06681738, -1.487759, -3.700008, 1, 1, 1, 1, 1,
-0.06632288, 0.6556791, -0.08751017, 0, 0, 1, 1, 1,
-0.06553196, 0.922734, 0.06114407, 1, 0, 0, 1, 1,
-0.06316192, -0.3647799, -3.155341, 1, 0, 0, 1, 1,
-0.05810719, -0.1979107, -2.554882, 1, 0, 0, 1, 1,
-0.05801005, 0.3577519, -0.1212602, 1, 0, 0, 1, 1,
-0.05591122, -2.26913, -3.718174, 1, 0, 0, 1, 1,
-0.05396162, -0.2764744, -1.394577, 0, 0, 0, 1, 1,
-0.04792044, -2.698653, -2.494337, 0, 0, 0, 1, 1,
-0.04734224, -0.7225216, -4.142673, 0, 0, 0, 1, 1,
-0.04629754, -0.3691408, -2.479515, 0, 0, 0, 1, 1,
-0.04550301, 0.001148505, -1.401411, 0, 0, 0, 1, 1,
-0.04247347, 0.1128376, -1.891369, 0, 0, 0, 1, 1,
-0.0413187, 1.337446, -0.2970544, 0, 0, 0, 1, 1,
-0.04119462, -0.569856, -2.116136, 1, 1, 1, 1, 1,
-0.03909149, -0.5646841, -3.623808, 1, 1, 1, 1, 1,
-0.0386774, 0.1779057, 0.103989, 1, 1, 1, 1, 1,
-0.03791429, -0.6152931, -3.960338, 1, 1, 1, 1, 1,
-0.03232963, -0.277576, -4.93362, 1, 1, 1, 1, 1,
-0.02969724, 0.3224745, -0.3801821, 1, 1, 1, 1, 1,
-0.02710809, -1.011099, -1.685758, 1, 1, 1, 1, 1,
-0.02688185, 0.7702141, -1.413924, 1, 1, 1, 1, 1,
-0.02565853, -0.401719, -2.214781, 1, 1, 1, 1, 1,
-0.02485456, -2.020487, -1.860121, 1, 1, 1, 1, 1,
-0.02468072, -0.1374539, -2.945242, 1, 1, 1, 1, 1,
-0.02137969, -0.2809908, -5.402136, 1, 1, 1, 1, 1,
-0.01923507, 1.168326, 0.8420496, 1, 1, 1, 1, 1,
-0.01676323, 0.7332926, -0.9602497, 1, 1, 1, 1, 1,
-0.01549447, -0.1090104, -1.541803, 1, 1, 1, 1, 1,
-0.01491003, -0.4959316, -3.540494, 0, 0, 1, 1, 1,
-0.01349892, -1.904703, -4.321694, 1, 0, 0, 1, 1,
-0.009238819, -1.428227, -3.877904, 1, 0, 0, 1, 1,
-0.00762417, -0.9567673, -3.085284, 1, 0, 0, 1, 1,
0.003808828, -0.09911327, 3.03267, 1, 0, 0, 1, 1,
0.003859602, 1.24476, -1.271449, 1, 0, 0, 1, 1,
0.004546345, -0.3389539, 2.188784, 0, 0, 0, 1, 1,
0.004825788, 0.06970217, -1.240126, 0, 0, 0, 1, 1,
0.009606491, -1.941271, 3.695291, 0, 0, 0, 1, 1,
0.01251243, -0.1848202, 3.565165, 0, 0, 0, 1, 1,
0.01547467, -0.8461264, 3.241221, 0, 0, 0, 1, 1,
0.01643511, 1.225556, 0.7872201, 0, 0, 0, 1, 1,
0.01715291, 0.8155639, -0.4455753, 0, 0, 0, 1, 1,
0.017904, -0.1115675, 3.330162, 1, 1, 1, 1, 1,
0.02980753, 0.03110647, 1.399631, 1, 1, 1, 1, 1,
0.03049977, -0.3288537, 4.825925, 1, 1, 1, 1, 1,
0.03242862, 0.4151902, 0.5695508, 1, 1, 1, 1, 1,
0.04074793, 1.73533, -0.6219236, 1, 1, 1, 1, 1,
0.04198601, 0.4032074, 0.3539147, 1, 1, 1, 1, 1,
0.04345196, -0.4920267, 2.672755, 1, 1, 1, 1, 1,
0.04464294, -0.2005427, 1.692528, 1, 1, 1, 1, 1,
0.04760153, -0.03176425, 2.608508, 1, 1, 1, 1, 1,
0.04975644, -1.096981, 2.314664, 1, 1, 1, 1, 1,
0.05003982, 0.3587527, -1.647074, 1, 1, 1, 1, 1,
0.05353469, -0.4294358, 3.689016, 1, 1, 1, 1, 1,
0.05515909, -1.057283, 1.181087, 1, 1, 1, 1, 1,
0.05603185, 0.3601167, -0.02838337, 1, 1, 1, 1, 1,
0.05835639, -0.4822619, 4.258597, 1, 1, 1, 1, 1,
0.06102835, -0.1246932, 3.688682, 0, 0, 1, 1, 1,
0.06658138, 0.7962468, 0.008196345, 1, 0, 0, 1, 1,
0.06667262, 0.1814032, 0.4376016, 1, 0, 0, 1, 1,
0.07034891, -0.1531053, 3.067355, 1, 0, 0, 1, 1,
0.07123118, -0.8953197, 3.498702, 1, 0, 0, 1, 1,
0.07390779, 0.7663786, -0.3543804, 1, 0, 0, 1, 1,
0.07514248, -2.192485, 3.701711, 0, 0, 0, 1, 1,
0.07537388, -0.07961281, 2.269862, 0, 0, 0, 1, 1,
0.07693798, -1.3422, 2.910634, 0, 0, 0, 1, 1,
0.07905752, -2.229211, 3.128499, 0, 0, 0, 1, 1,
0.09271079, 1.039061, 0.7035928, 0, 0, 0, 1, 1,
0.1001851, -0.7554017, 4.954741, 0, 0, 0, 1, 1,
0.1015601, -0.4743603, 2.258684, 0, 0, 0, 1, 1,
0.1023628, -0.2201694, 2.912601, 1, 1, 1, 1, 1,
0.1044284, 0.8714814, 0.2707805, 1, 1, 1, 1, 1,
0.1185544, -0.5545896, 4.569286, 1, 1, 1, 1, 1,
0.1192938, -0.9703891, 4.597569, 1, 1, 1, 1, 1,
0.1222497, 0.5256968, 1.852238, 1, 1, 1, 1, 1,
0.1307066, -1.925159, 1.99935, 1, 1, 1, 1, 1,
0.1338541, -0.8923407, 2.413472, 1, 1, 1, 1, 1,
0.1381768, 1.339724, 0.9616138, 1, 1, 1, 1, 1,
0.1413096, 0.507257, -0.5932069, 1, 1, 1, 1, 1,
0.1413571, -1.002648, 3.87095, 1, 1, 1, 1, 1,
0.1461021, -0.3231535, 1.360482, 1, 1, 1, 1, 1,
0.1480868, -0.6172558, 3.291393, 1, 1, 1, 1, 1,
0.1501514, 0.7417332, 0.06852465, 1, 1, 1, 1, 1,
0.1511728, -0.008019222, 1.73612, 1, 1, 1, 1, 1,
0.1522048, -0.4974546, 3.277927, 1, 1, 1, 1, 1,
0.1590458, 0.8280664, -0.03091894, 0, 0, 1, 1, 1,
0.1606086, -0.7623315, 1.567506, 1, 0, 0, 1, 1,
0.164461, -0.8054449, 3.95261, 1, 0, 0, 1, 1,
0.166538, -0.1750599, 5.129912, 1, 0, 0, 1, 1,
0.1667596, 0.2488361, 0.07596911, 1, 0, 0, 1, 1,
0.1668035, -0.2039132, 2.755246, 1, 0, 0, 1, 1,
0.1692641, 0.5365826, -0.9173831, 0, 0, 0, 1, 1,
0.1697946, 0.3937812, 1.244597, 0, 0, 0, 1, 1,
0.171029, -0.1852847, 1.644301, 0, 0, 0, 1, 1,
0.1712575, 0.06019368, 1.231, 0, 0, 0, 1, 1,
0.1743315, 0.3121506, -1.06738, 0, 0, 0, 1, 1,
0.1772319, -0.7228748, 3.476473, 0, 0, 0, 1, 1,
0.1775135, -0.5618663, 3.783742, 0, 0, 0, 1, 1,
0.1809203, -0.707464, 4.160184, 1, 1, 1, 1, 1,
0.1871748, -0.5737349, 3.22795, 1, 1, 1, 1, 1,
0.1894039, 0.8591385, -0.4103577, 1, 1, 1, 1, 1,
0.1928031, -3.006819, 3.22696, 1, 1, 1, 1, 1,
0.1945553, 0.6440069, -0.6842847, 1, 1, 1, 1, 1,
0.1973162, 1.418408, -0.106232, 1, 1, 1, 1, 1,
0.200146, 0.4286152, 1.870839, 1, 1, 1, 1, 1,
0.200438, 0.1041286, 2.194915, 1, 1, 1, 1, 1,
0.2057868, -0.2561312, 3.572201, 1, 1, 1, 1, 1,
0.210113, -0.009035278, 1.191786, 1, 1, 1, 1, 1,
0.2126939, -0.1577675, 2.174091, 1, 1, 1, 1, 1,
0.2135786, 1.248175, -1.038651, 1, 1, 1, 1, 1,
0.2195941, 1.792416, -0.6484524, 1, 1, 1, 1, 1,
0.2201373, 0.8414098, 0.83206, 1, 1, 1, 1, 1,
0.2221499, 0.2225095, 2.886114, 1, 1, 1, 1, 1,
0.2228599, 1.788163, 1.170178, 0, 0, 1, 1, 1,
0.2230823, -2.403982, 3.112829, 1, 0, 0, 1, 1,
0.2242014, -0.5245061, 3.410284, 1, 0, 0, 1, 1,
0.2242031, 0.9892552, -0.9982803, 1, 0, 0, 1, 1,
0.2271307, 0.3828706, 1.249097, 1, 0, 0, 1, 1,
0.228579, -2.323264, 2.593271, 1, 0, 0, 1, 1,
0.2322689, -0.2908207, -0.3414187, 0, 0, 0, 1, 1,
0.2349818, 1.026134, -0.2285306, 0, 0, 0, 1, 1,
0.2352006, -0.04788296, 1.331378, 0, 0, 0, 1, 1,
0.2356539, -1.301987, 3.609602, 0, 0, 0, 1, 1,
0.2487107, -0.4211209, 2.80661, 0, 0, 0, 1, 1,
0.2497478, 0.9524913, 0.1081719, 0, 0, 0, 1, 1,
0.2504177, 0.9537163, 1.43865, 0, 0, 0, 1, 1,
0.2552607, -0.02364211, 3.129477, 1, 1, 1, 1, 1,
0.2620368, 0.6649155, -0.9794704, 1, 1, 1, 1, 1,
0.2623319, 0.2693113, 1.110069, 1, 1, 1, 1, 1,
0.2679435, -1.363423, 2.326225, 1, 1, 1, 1, 1,
0.2681136, -0.3907234, 0.8044794, 1, 1, 1, 1, 1,
0.2743072, 0.4048678, 2.545097, 1, 1, 1, 1, 1,
0.2768562, 0.8710645, 1.619007, 1, 1, 1, 1, 1,
0.2783888, -0.2236101, 3.726402, 1, 1, 1, 1, 1,
0.2787735, -0.4392139, 1.742111, 1, 1, 1, 1, 1,
0.2789375, 0.808892, 0.1386205, 1, 1, 1, 1, 1,
0.2791293, 0.1201314, 1.487492, 1, 1, 1, 1, 1,
0.284813, 0.8825682, 0.009879011, 1, 1, 1, 1, 1,
0.2936458, 0.6074531, 2.364932, 1, 1, 1, 1, 1,
0.295891, -0.661443, 2.544502, 1, 1, 1, 1, 1,
0.2965068, 0.7713174, 2.683465, 1, 1, 1, 1, 1,
0.2979207, -1.623197, 1.938558, 0, 0, 1, 1, 1,
0.3051116, 1.713603, 0.4721346, 1, 0, 0, 1, 1,
0.3113935, -0.8148084, 2.533936, 1, 0, 0, 1, 1,
0.312942, 0.7709625, 0.7733594, 1, 0, 0, 1, 1,
0.3132235, -0.6839709, 2.564799, 1, 0, 0, 1, 1,
0.315739, 1.316995, -0.3429472, 1, 0, 0, 1, 1,
0.3223699, 0.04298101, 3.306692, 0, 0, 0, 1, 1,
0.3233891, 1.821267, -1.455329, 0, 0, 0, 1, 1,
0.3270247, 1.432952, -0.9687853, 0, 0, 0, 1, 1,
0.3328706, -1.084021, 2.311918, 0, 0, 0, 1, 1,
0.3334, 1.761579, -0.6397141, 0, 0, 0, 1, 1,
0.3378901, 0.5589111, -0.9482307, 0, 0, 0, 1, 1,
0.3423769, -0.2307289, 2.138869, 0, 0, 0, 1, 1,
0.3437929, -0.2791918, 3.089641, 1, 1, 1, 1, 1,
0.3463562, -0.09860178, 1.72649, 1, 1, 1, 1, 1,
0.3500327, -0.5960253, 3.564946, 1, 1, 1, 1, 1,
0.3508123, 1.600272, 0.2870634, 1, 1, 1, 1, 1,
0.3511796, 1.064674, -0.7407619, 1, 1, 1, 1, 1,
0.358023, -1.158489, 4.24931, 1, 1, 1, 1, 1,
0.358245, -1.045105, 3.29855, 1, 1, 1, 1, 1,
0.3601201, -0.4349255, 1.710699, 1, 1, 1, 1, 1,
0.3635733, 1.072978, 0.5866424, 1, 1, 1, 1, 1,
0.3647236, 1.600808, 0.6155486, 1, 1, 1, 1, 1,
0.3673264, -1.942809, 3.041794, 1, 1, 1, 1, 1,
0.3705883, 0.4494155, 2.439205, 1, 1, 1, 1, 1,
0.3716362, -1.270395, 2.397557, 1, 1, 1, 1, 1,
0.3755763, 1.206528, 1.636064, 1, 1, 1, 1, 1,
0.3758679, -1.382982, 2.805954, 1, 1, 1, 1, 1,
0.3772697, -0.1425671, -0.1929362, 0, 0, 1, 1, 1,
0.3779937, -0.1689932, 2.24265, 1, 0, 0, 1, 1,
0.3855964, 3.520406, -0.02026707, 1, 0, 0, 1, 1,
0.3870528, 2.290834, 0.9852622, 1, 0, 0, 1, 1,
0.3909756, 1.23185, 0.9428035, 1, 0, 0, 1, 1,
0.3930478, -0.5785707, 1.941187, 1, 0, 0, 1, 1,
0.3937866, -0.5834548, 1.632457, 0, 0, 0, 1, 1,
0.3944181, -0.5602148, 2.326561, 0, 0, 0, 1, 1,
0.396111, -0.2864917, 2.512215, 0, 0, 0, 1, 1,
0.3999262, 0.7588734, -0.3643526, 0, 0, 0, 1, 1,
0.4023331, 0.6104848, 0.297066, 0, 0, 0, 1, 1,
0.4024237, -0.4126517, 3.780569, 0, 0, 0, 1, 1,
0.4031169, 0.7150149, 0.4462169, 0, 0, 0, 1, 1,
0.4067187, 0.1400997, 3.472379, 1, 1, 1, 1, 1,
0.4118648, -1.031589, 3.725797, 1, 1, 1, 1, 1,
0.4135385, -2.761654, 4.235142, 1, 1, 1, 1, 1,
0.4232044, 0.2657311, 2.127721, 1, 1, 1, 1, 1,
0.4269147, 0.5502657, 0.01960367, 1, 1, 1, 1, 1,
0.429391, 0.9774795, 0.782202, 1, 1, 1, 1, 1,
0.4307394, 0.3321036, 1.692847, 1, 1, 1, 1, 1,
0.4312874, -1.70081, 3.253388, 1, 1, 1, 1, 1,
0.4324198, -0.3442328, 2.560648, 1, 1, 1, 1, 1,
0.4330299, 0.0917929, 1.249793, 1, 1, 1, 1, 1,
0.4342504, -0.8276185, 2.298038, 1, 1, 1, 1, 1,
0.4417406, -0.4819601, 1.210999, 1, 1, 1, 1, 1,
0.4423054, -1.326078, 2.273922, 1, 1, 1, 1, 1,
0.4499253, 1.269004, -0.3198969, 1, 1, 1, 1, 1,
0.4526823, -0.0579472, 0.6030013, 1, 1, 1, 1, 1,
0.4532063, 0.04723827, 1.941266, 0, 0, 1, 1, 1,
0.4606855, -1.203898, 1.040318, 1, 0, 0, 1, 1,
0.4637834, 1.167701, 1.745402, 1, 0, 0, 1, 1,
0.4639924, 2.050604, 0.845929, 1, 0, 0, 1, 1,
0.466932, 0.3268883, 0.236838, 1, 0, 0, 1, 1,
0.4693856, 1.1577, 0.1872102, 1, 0, 0, 1, 1,
0.4729329, -1.429303, 4.286565, 0, 0, 0, 1, 1,
0.4742241, -0.1386035, -1.137629, 0, 0, 0, 1, 1,
0.4837596, -1.179818, 4.044345, 0, 0, 0, 1, 1,
0.4842409, -1.470085, 3.357061, 0, 0, 0, 1, 1,
0.4944906, 0.2140789, 2.869453, 0, 0, 0, 1, 1,
0.5019319, -1.34465, 2.723134, 0, 0, 0, 1, 1,
0.5041755, -0.3251541, 1.626251, 0, 0, 0, 1, 1,
0.5080765, -0.2834169, 2.344, 1, 1, 1, 1, 1,
0.5150165, -0.5676692, 3.192336, 1, 1, 1, 1, 1,
0.5160964, -0.7532756, 1.768849, 1, 1, 1, 1, 1,
0.519927, -0.3688563, 0.8791331, 1, 1, 1, 1, 1,
0.5293219, 2.468349, 0.1389537, 1, 1, 1, 1, 1,
0.5324859, 0.4830835, 0.8625365, 1, 1, 1, 1, 1,
0.5330873, -1.508693, 4.08, 1, 1, 1, 1, 1,
0.5342123, 0.3809867, 1.777614, 1, 1, 1, 1, 1,
0.5370383, 0.0876188, 2.183006, 1, 1, 1, 1, 1,
0.5406713, -0.888182, 2.624753, 1, 1, 1, 1, 1,
0.5442299, 0.8004022, 1.701848, 1, 1, 1, 1, 1,
0.5467464, 0.2829596, 2.342692, 1, 1, 1, 1, 1,
0.5468256, 0.8452935, 0.658656, 1, 1, 1, 1, 1,
0.5518981, 1.325069, -0.1846263, 1, 1, 1, 1, 1,
0.551918, 1.211947, -0.3234494, 1, 1, 1, 1, 1,
0.5546005, 0.6630153, 0.6453522, 0, 0, 1, 1, 1,
0.5568348, -1.249262, 3.744227, 1, 0, 0, 1, 1,
0.5582417, -0.7409382, 1.776711, 1, 0, 0, 1, 1,
0.5642029, -0.8294239, 0.7228495, 1, 0, 0, 1, 1,
0.5646077, 0.4147615, 0.7976415, 1, 0, 0, 1, 1,
0.5668133, -0.00127651, 3.527442, 1, 0, 0, 1, 1,
0.5692922, 1.327708, -0.03118972, 0, 0, 0, 1, 1,
0.573519, -1.220764, 0.8844637, 0, 0, 0, 1, 1,
0.5763915, 1.284024, 0.04891184, 0, 0, 0, 1, 1,
0.5784636, 0.6871206, 0.6538129, 0, 0, 0, 1, 1,
0.5836499, -0.1302671, 0.9506812, 0, 0, 0, 1, 1,
0.5865566, -0.2925033, 2.830548, 0, 0, 0, 1, 1,
0.5883055, -0.7993311, 3.875198, 0, 0, 0, 1, 1,
0.5912431, 0.2580964, -0.401475, 1, 1, 1, 1, 1,
0.6007977, 0.2726631, -0.3085106, 1, 1, 1, 1, 1,
0.6096618, 0.5269628, 1.451253, 1, 1, 1, 1, 1,
0.6101487, -1.85614, 1.78551, 1, 1, 1, 1, 1,
0.6110067, 0.7335056, -1.042065, 1, 1, 1, 1, 1,
0.6146448, 1.436929, 1.353759, 1, 1, 1, 1, 1,
0.6159746, -0.595009, 2.562817, 1, 1, 1, 1, 1,
0.6175395, 0.3071307, 0.8918487, 1, 1, 1, 1, 1,
0.6197491, -0.2266515, 2.593314, 1, 1, 1, 1, 1,
0.620798, -1.350138, 3.744388, 1, 1, 1, 1, 1,
0.6231443, -0.7102145, 0.6086101, 1, 1, 1, 1, 1,
0.6248505, -2.031298, 2.858459, 1, 1, 1, 1, 1,
0.6302601, -0.2201051, 2.052095, 1, 1, 1, 1, 1,
0.6322492, -0.2398049, 2.455212, 1, 1, 1, 1, 1,
0.633905, 0.9372341, 1.930761, 1, 1, 1, 1, 1,
0.638343, 0.9914603, -0.03811988, 0, 0, 1, 1, 1,
0.6400458, -0.9470139, 0.9881379, 1, 0, 0, 1, 1,
0.6473798, 0.819912, 2.122711, 1, 0, 0, 1, 1,
0.6520572, 1.466775, -0.6392956, 1, 0, 0, 1, 1,
0.6626418, -0.1412111, 0.7241164, 1, 0, 0, 1, 1,
0.6680174, 0.2612285, 0.5485014, 1, 0, 0, 1, 1,
0.6698148, 1.357004, -0.3419624, 0, 0, 0, 1, 1,
0.6711512, 0.6839875, -0.573312, 0, 0, 0, 1, 1,
0.6723938, -0.5837823, 3.258038, 0, 0, 0, 1, 1,
0.6745696, 0.267306, 0.7234153, 0, 0, 0, 1, 1,
0.6802198, -1.304531, 2.509155, 0, 0, 0, 1, 1,
0.6853552, 1.006496, -0.0153007, 0, 0, 0, 1, 1,
0.6856819, -0.4377759, 2.578559, 0, 0, 0, 1, 1,
0.6860138, 0.7235091, 2.064939, 1, 1, 1, 1, 1,
0.6911733, 0.2563322, 0.6523632, 1, 1, 1, 1, 1,
0.7015827, -0.197668, 1.648763, 1, 1, 1, 1, 1,
0.704708, -0.3067942, 3.450722, 1, 1, 1, 1, 1,
0.70837, -0.5368559, 0.5376842, 1, 1, 1, 1, 1,
0.7129446, -1.936895, 3.824378, 1, 1, 1, 1, 1,
0.7139164, -0.8355477, 1.09798, 1, 1, 1, 1, 1,
0.7191136, 0.910118, 1.595632, 1, 1, 1, 1, 1,
0.7219823, -1.302294, 2.252959, 1, 1, 1, 1, 1,
0.7234104, -0.05877154, 0.3171825, 1, 1, 1, 1, 1,
0.7317041, 0.8757975, -0.2062966, 1, 1, 1, 1, 1,
0.7351875, -0.02769483, 2.069168, 1, 1, 1, 1, 1,
0.7356061, -0.4930989, 1.07814, 1, 1, 1, 1, 1,
0.741926, 0.7720495, 0.5920745, 1, 1, 1, 1, 1,
0.7419288, -0.6605638, 1.940098, 1, 1, 1, 1, 1,
0.7466373, 0.5345159, 0.7413841, 0, 0, 1, 1, 1,
0.7475544, -0.1181093, 3.07417, 1, 0, 0, 1, 1,
0.7585237, 0.1121007, 2.913681, 1, 0, 0, 1, 1,
0.7593536, 1.028037, 1.414921, 1, 0, 0, 1, 1,
0.7643749, -0.2630826, 2.977982, 1, 0, 0, 1, 1,
0.7660062, 0.6118761, -1.864391, 1, 0, 0, 1, 1,
0.767234, 0.1135071, 0.1909381, 0, 0, 0, 1, 1,
0.7836157, -0.2271746, 0.8994762, 0, 0, 0, 1, 1,
0.7905681, -1.746128, 2.739241, 0, 0, 0, 1, 1,
0.7940471, 0.3287239, 0.6462934, 0, 0, 0, 1, 1,
0.7997557, 0.6384529, 0.8906111, 0, 0, 0, 1, 1,
0.8013095, 2.447689, 0.8153812, 0, 0, 0, 1, 1,
0.804197, -1.478412, 0.8152514, 0, 0, 0, 1, 1,
0.8072384, 1.594453, 2.092132, 1, 1, 1, 1, 1,
0.8177972, -0.609917, 2.178607, 1, 1, 1, 1, 1,
0.818449, -0.746905, 2.60463, 1, 1, 1, 1, 1,
0.826298, -0.272598, 1.91524, 1, 1, 1, 1, 1,
0.826602, -2.617687, 1.74947, 1, 1, 1, 1, 1,
0.8278127, -0.10373, 1.207497, 1, 1, 1, 1, 1,
0.8314229, -0.5642018, 4.442585, 1, 1, 1, 1, 1,
0.8326833, -0.8609728, 1.322938, 1, 1, 1, 1, 1,
0.8355646, -0.9726169, 2.834502, 1, 1, 1, 1, 1,
0.836758, -0.3321093, -0.2427588, 1, 1, 1, 1, 1,
0.8382063, 0.3403457, 1.50102, 1, 1, 1, 1, 1,
0.8414999, 0.5674095, -1.039631, 1, 1, 1, 1, 1,
0.8416623, -1.220877, 1.893742, 1, 1, 1, 1, 1,
0.8422451, -0.2096511, 0.6642432, 1, 1, 1, 1, 1,
0.8427445, -0.8775821, 2.702306, 1, 1, 1, 1, 1,
0.8458946, -1.517421, 3.027278, 0, 0, 1, 1, 1,
0.8475017, -0.2915297, 1.823133, 1, 0, 0, 1, 1,
0.8505338, -0.5252628, 0.7184305, 1, 0, 0, 1, 1,
0.8566544, -0.2856833, 2.994966, 1, 0, 0, 1, 1,
0.8574106, 1.38233, 1.029463, 1, 0, 0, 1, 1,
0.8612226, 0.7252488, -0.3703463, 1, 0, 0, 1, 1,
0.864481, 1.210922, -0.3881539, 0, 0, 0, 1, 1,
0.8679535, -0.6914034, 1.587356, 0, 0, 0, 1, 1,
0.8695394, -0.3816823, 1.206536, 0, 0, 0, 1, 1,
0.8765173, -0.1789002, 1.229595, 0, 0, 0, 1, 1,
0.8810006, 0.4030993, 1.839585, 0, 0, 0, 1, 1,
0.8834289, 0.9483204, 1.355293, 0, 0, 0, 1, 1,
0.897012, -0.1415785, 1.376457, 0, 0, 0, 1, 1,
0.9002748, 0.749974, 0.748517, 1, 1, 1, 1, 1,
0.9009442, -0.3823913, 1.660907, 1, 1, 1, 1, 1,
0.9061311, 0.6498001, -0.07510617, 1, 1, 1, 1, 1,
0.9069379, 0.8494538, -0.8864117, 1, 1, 1, 1, 1,
0.9146735, -0.742224, 1.486644, 1, 1, 1, 1, 1,
0.9166144, -0.570593, 1.461326, 1, 1, 1, 1, 1,
0.9194157, 0.6323788, 1.991615, 1, 1, 1, 1, 1,
0.9213497, 1.44008, -0.2106839, 1, 1, 1, 1, 1,
0.9224519, 1.217958, 0.331009, 1, 1, 1, 1, 1,
0.9231636, -0.2512639, 2.625162, 1, 1, 1, 1, 1,
0.9245965, 1.093526, -1.898341, 1, 1, 1, 1, 1,
0.927204, -0.9346286, 3.169935, 1, 1, 1, 1, 1,
0.9273388, -1.31117, 1.188845, 1, 1, 1, 1, 1,
0.9399126, 1.950984, -0.4692853, 1, 1, 1, 1, 1,
0.9414825, 1.387608, -0.9926509, 1, 1, 1, 1, 1,
0.9420108, 2.106859, 1.108153, 0, 0, 1, 1, 1,
0.9490653, -0.4353815, 1.410511, 1, 0, 0, 1, 1,
0.9501674, -1.098428, 0.6828091, 1, 0, 0, 1, 1,
0.950377, -1.167994, 1.70714, 1, 0, 0, 1, 1,
0.9574033, -0.06134537, 0.6765732, 1, 0, 0, 1, 1,
0.9599684, 0.5028209, 0.854039, 1, 0, 0, 1, 1,
0.9632556, 0.7340089, 0.945599, 0, 0, 0, 1, 1,
0.9713867, -1.168816, 1.206191, 0, 0, 0, 1, 1,
0.9716637, 1.1663, 1.424317, 0, 0, 0, 1, 1,
0.9817191, -2.701758, 2.420877, 0, 0, 0, 1, 1,
0.9860821, 0.4159278, -1.178387, 0, 0, 0, 1, 1,
0.9944401, -1.129009, 3.282547, 0, 0, 0, 1, 1,
0.9988634, -0.8588628, 3.736244, 0, 0, 0, 1, 1,
1.001129, 0.340191, 0.9764814, 1, 1, 1, 1, 1,
1.001131, -0.2880518, 0.06863631, 1, 1, 1, 1, 1,
1.003748, 0.9030221, 1.182049, 1, 1, 1, 1, 1,
1.007494, 0.04266987, -0.1390761, 1, 1, 1, 1, 1,
1.008586, 0.05810518, 1.331573, 1, 1, 1, 1, 1,
1.030475, 1.083204, 1.561206, 1, 1, 1, 1, 1,
1.030745, -0.3718446, 2.830404, 1, 1, 1, 1, 1,
1.035698, 0.5896277, 0.420206, 1, 1, 1, 1, 1,
1.037898, -0.5512957, 0.4159145, 1, 1, 1, 1, 1,
1.039746, 1.855383, 2.253225, 1, 1, 1, 1, 1,
1.047017, 1.79236, 1.455313, 1, 1, 1, 1, 1,
1.060422, -1.768872, 3.826606, 1, 1, 1, 1, 1,
1.076703, 0.7087761, 2.691955, 1, 1, 1, 1, 1,
1.077829, -1.047551, 2.496611, 1, 1, 1, 1, 1,
1.079915, 2.878514, -0.101145, 1, 1, 1, 1, 1,
1.086416, -3.153423, 1.969855, 0, 0, 1, 1, 1,
1.088435, 1.022802, 0.3144067, 1, 0, 0, 1, 1,
1.111111, 1.671039, 0.882113, 1, 0, 0, 1, 1,
1.111148, 2.729291, -1.309309, 1, 0, 0, 1, 1,
1.112932, 0.06138822, 0.770674, 1, 0, 0, 1, 1,
1.113419, -0.4563283, 2.986574, 1, 0, 0, 1, 1,
1.133868, 0.03787773, 1.727554, 0, 0, 0, 1, 1,
1.141411, 0.7993087, 0.8119771, 0, 0, 0, 1, 1,
1.150136, 0.09223136, 1.870035, 0, 0, 0, 1, 1,
1.156973, 0.8108912, 2.762334, 0, 0, 0, 1, 1,
1.16369, 0.8167887, 0.4844369, 0, 0, 0, 1, 1,
1.165073, 1.788679, -0.3608765, 0, 0, 0, 1, 1,
1.171731, -0.5575491, 3.535539, 0, 0, 0, 1, 1,
1.1742, 0.3483109, 2.128719, 1, 1, 1, 1, 1,
1.178074, 1.403498, 0.4021732, 1, 1, 1, 1, 1,
1.189561, -1.755715, 5.17115, 1, 1, 1, 1, 1,
1.191407, 0.8426129, 0.8108084, 1, 1, 1, 1, 1,
1.198758, -0.2145059, 0.9755803, 1, 1, 1, 1, 1,
1.204048, 1.45241, -0.567341, 1, 1, 1, 1, 1,
1.204689, -0.6045348, 1.100718, 1, 1, 1, 1, 1,
1.207104, 0.1278189, 3.14554, 1, 1, 1, 1, 1,
1.209044, 0.1789045, 1.831927, 1, 1, 1, 1, 1,
1.216529, 1.113943, 2.045728, 1, 1, 1, 1, 1,
1.225361, -0.003400227, 0.8649502, 1, 1, 1, 1, 1,
1.226175, 0.7928055, 2.294116, 1, 1, 1, 1, 1,
1.230049, -1.290547, 1.002314, 1, 1, 1, 1, 1,
1.240297, 0.3996696, 0.9618655, 1, 1, 1, 1, 1,
1.241628, -0.4527732, 3.153418, 1, 1, 1, 1, 1,
1.245584, 0.2305413, 1.865698, 0, 0, 1, 1, 1,
1.24781, -0.02390443, 2.213891, 1, 0, 0, 1, 1,
1.248159, -0.3886534, 1.087639, 1, 0, 0, 1, 1,
1.248585, -0.7754273, 3.316269, 1, 0, 0, 1, 1,
1.252574, -0.006516749, 1.484238, 1, 0, 0, 1, 1,
1.252999, 0.1874225, 2.165393, 1, 0, 0, 1, 1,
1.266606, -0.06467821, 2.112904, 0, 0, 0, 1, 1,
1.275946, -0.8942545, 2.865134, 0, 0, 0, 1, 1,
1.276345, 0.6258531, 4.847071, 0, 0, 0, 1, 1,
1.283392, 0.1787591, 0.4483303, 0, 0, 0, 1, 1,
1.289207, -1.114499, 2.445072, 0, 0, 0, 1, 1,
1.305423, 0.04207195, 2.055748, 0, 0, 0, 1, 1,
1.310784, -0.3077511, 2.166654, 0, 0, 0, 1, 1,
1.315308, 0.1720565, 2.158905, 1, 1, 1, 1, 1,
1.316303, 1.16705, -0.3073961, 1, 1, 1, 1, 1,
1.333609, 0.01027426, 1.125701, 1, 1, 1, 1, 1,
1.336832, 1.143121, -0.2317181, 1, 1, 1, 1, 1,
1.340471, 0.7104173, 2.201291, 1, 1, 1, 1, 1,
1.348106, -0.01850622, 0.5816984, 1, 1, 1, 1, 1,
1.359322, 0.3818204, 0.4148153, 1, 1, 1, 1, 1,
1.36863, 1.537665, -0.1246202, 1, 1, 1, 1, 1,
1.379399, -1.089074, 1.820421, 1, 1, 1, 1, 1,
1.382559, -1.714041, 1.979104, 1, 1, 1, 1, 1,
1.385035, -0.7121362, 3.495698, 1, 1, 1, 1, 1,
1.388095, -2.923908, 3.439849, 1, 1, 1, 1, 1,
1.393217, -0.3016457, 2.368827, 1, 1, 1, 1, 1,
1.39355, 0.2122008, 0.5325457, 1, 1, 1, 1, 1,
1.425339, -0.440105, 2.012962, 1, 1, 1, 1, 1,
1.449069, 0.3936736, 0.7108141, 0, 0, 1, 1, 1,
1.454767, 0.8306705, 0.8620297, 1, 0, 0, 1, 1,
1.457569, 0.4610995, 2.349689, 1, 0, 0, 1, 1,
1.464187, 2.249614, -0.8322365, 1, 0, 0, 1, 1,
1.470187, 0.08771998, -0.7991369, 1, 0, 0, 1, 1,
1.474376, -1.993929, 3.892846, 1, 0, 0, 1, 1,
1.478214, -1.024801, 1.619513, 0, 0, 0, 1, 1,
1.48465, 0.6430103, 3.575718, 0, 0, 0, 1, 1,
1.491045, 0.01976821, 1.974662, 0, 0, 0, 1, 1,
1.491887, -0.6607124, 0.5707781, 0, 0, 0, 1, 1,
1.492399, -0.3453295, 2.539535, 0, 0, 0, 1, 1,
1.499061, 0.9944989, 2.258035, 0, 0, 0, 1, 1,
1.499075, -0.7348197, 2.0431, 0, 0, 0, 1, 1,
1.505449, -0.3455235, 1.45169, 1, 1, 1, 1, 1,
1.535278, 0.3374505, 1.455333, 1, 1, 1, 1, 1,
1.551389, 1.044862, 1.423894, 1, 1, 1, 1, 1,
1.56541, 0.6484854, 1.242785, 1, 1, 1, 1, 1,
1.566393, -0.4092221, 3.399373, 1, 1, 1, 1, 1,
1.571566, -0.8784714, 2.547835, 1, 1, 1, 1, 1,
1.573473, -0.279332, 0.9463236, 1, 1, 1, 1, 1,
1.577498, -0.6975344, 0.4149888, 1, 1, 1, 1, 1,
1.60019, 0.5117232, 4.553109, 1, 1, 1, 1, 1,
1.606885, -0.5610551, 1.369227, 1, 1, 1, 1, 1,
1.611388, 0.5639414, 0.2151659, 1, 1, 1, 1, 1,
1.644046, 1.39099, -1.235231, 1, 1, 1, 1, 1,
1.652098, 2.376236, 1.031365, 1, 1, 1, 1, 1,
1.683908, 0.6566044, 1.543858, 1, 1, 1, 1, 1,
1.693986, 0.4222142, 2.538623, 1, 1, 1, 1, 1,
1.705058, -2.612336, 1.903125, 0, 0, 1, 1, 1,
1.714699, 0.05767838, 2.240682, 1, 0, 0, 1, 1,
1.718613, -0.6937763, 3.094636, 1, 0, 0, 1, 1,
1.718986, -0.4622518, 2.332672, 1, 0, 0, 1, 1,
1.721762, 0.01358912, 1.235928, 1, 0, 0, 1, 1,
1.734173, 0.1383351, 3.928182, 1, 0, 0, 1, 1,
1.734807, -1.27691, 1.533305, 0, 0, 0, 1, 1,
1.735498, 1.150178, -0.6062988, 0, 0, 0, 1, 1,
1.739334, 0.8932747, -0.02838167, 0, 0, 0, 1, 1,
1.748359, 0.5778, 2.09876, 0, 0, 0, 1, 1,
1.750161, 0.4897248, 0.963469, 0, 0, 0, 1, 1,
1.754859, -0.9271569, 2.004196, 0, 0, 0, 1, 1,
1.764459, 1.125639, 1.320449, 0, 0, 0, 1, 1,
1.7734, -0.3647482, 1.099883, 1, 1, 1, 1, 1,
1.789471, -0.2905463, -0.07466366, 1, 1, 1, 1, 1,
1.802108, 0.5585439, 2.872118, 1, 1, 1, 1, 1,
1.829787, -0.7438033, 2.46435, 1, 1, 1, 1, 1,
1.838086, 0.02228401, 2.509344, 1, 1, 1, 1, 1,
1.884324, 0.7980094, 1.241315, 1, 1, 1, 1, 1,
1.897019, 0.9534133, -0.7465479, 1, 1, 1, 1, 1,
1.907493, 0.4118614, 2.146693, 1, 1, 1, 1, 1,
1.921928, -0.3546789, 2.182342, 1, 1, 1, 1, 1,
1.925624, -0.1197811, 1.553527, 1, 1, 1, 1, 1,
1.935523, -1.603325, 3.39556, 1, 1, 1, 1, 1,
1.946196, -0.489156, 2.951097, 1, 1, 1, 1, 1,
1.974969, 0.1184403, 1.992211, 1, 1, 1, 1, 1,
2.027029, -0.001597702, 0.977267, 1, 1, 1, 1, 1,
2.034861, 0.5864729, 0.5244258, 1, 1, 1, 1, 1,
2.107088, -0.8425899, 0.6682942, 0, 0, 1, 1, 1,
2.113491, 0.6194764, 0.8637405, 1, 0, 0, 1, 1,
2.176463, -0.7194631, 1.646901, 1, 0, 0, 1, 1,
2.250226, 0.2563452, 0.932044, 1, 0, 0, 1, 1,
2.259337, -0.13143, 2.196231, 1, 0, 0, 1, 1,
2.315274, 2.866657, 2.347698, 1, 0, 0, 1, 1,
2.349836, 0.2251749, 0.2276295, 0, 0, 0, 1, 1,
2.359764, -0.9801906, 1.042196, 0, 0, 0, 1, 1,
2.383667, 0.04729881, 3.508582, 0, 0, 0, 1, 1,
2.389046, 0.7943999, 0.07379621, 0, 0, 0, 1, 1,
2.412462, -0.7093284, 2.281351, 0, 0, 0, 1, 1,
2.444086, 0.1271061, 3.766489, 0, 0, 0, 1, 1,
2.460418, 1.205385, 1.212611, 0, 0, 0, 1, 1,
2.571269, -0.03570447, 1.433805, 1, 1, 1, 1, 1,
2.589835, 1.123693, 0.9393126, 1, 1, 1, 1, 1,
2.63871, -0.5455905, 0.5548562, 1, 1, 1, 1, 1,
2.707824, 0.4636361, 1.818188, 1, 1, 1, 1, 1,
2.708218, 1.547198, 1.002009, 1, 1, 1, 1, 1,
2.721733, -0.007363108, -0.8397567, 1, 1, 1, 1, 1,
2.754321, 0.5472489, 0.4012125, 1, 1, 1, 1, 1
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
var radius = 9.611402;
var distance = 33.75964;
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
mvMatrix.translate( -0.1299278, -0.1834912, 0.4922779 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.75964);
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
