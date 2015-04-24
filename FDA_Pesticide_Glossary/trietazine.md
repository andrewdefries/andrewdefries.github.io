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
-3.299577, 0.7452531, -2.489022, 1, 0, 0, 1,
-3.188649, 0.7642751, -1.398287, 1, 0.007843138, 0, 1,
-2.886995, -0.5707409, -0.886053, 1, 0.01176471, 0, 1,
-2.490687, 0.9698525, -2.397682, 1, 0.01960784, 0, 1,
-2.473335, -1.054962, -1.662409, 1, 0.02352941, 0, 1,
-2.452332, 1.331118, -2.076167, 1, 0.03137255, 0, 1,
-2.433062, 0.6369369, -2.137367, 1, 0.03529412, 0, 1,
-2.351878, 1.062721, -1.137126, 1, 0.04313726, 0, 1,
-2.310512, 0.9621335, -1.702022, 1, 0.04705882, 0, 1,
-2.288983, 0.8351712, -0.7070413, 1, 0.05490196, 0, 1,
-2.269572, -0.586764, -2.845191, 1, 0.05882353, 0, 1,
-2.267743, -0.2128887, -0.3951539, 1, 0.06666667, 0, 1,
-2.261424, -0.1984108, -0.9216539, 1, 0.07058824, 0, 1,
-2.22855, -0.06446739, -3.307914, 1, 0.07843138, 0, 1,
-2.161887, 1.596366, -1.570474, 1, 0.08235294, 0, 1,
-2.146333, -1.481982, -1.909297, 1, 0.09019608, 0, 1,
-2.135591, 0.1383134, -1.560554, 1, 0.09411765, 0, 1,
-2.09467, -1.421751, 0.2609468, 1, 0.1019608, 0, 1,
-2.091354, 0.2147307, 0.9470527, 1, 0.1098039, 0, 1,
-2.078373, 1.168737, 0.3270057, 1, 0.1137255, 0, 1,
-2.073291, 1.315512, -2.214277, 1, 0.1215686, 0, 1,
-2.068159, 0.4883105, -0.8338037, 1, 0.1254902, 0, 1,
-1.993889, -0.002980406, -2.630418, 1, 0.1333333, 0, 1,
-1.972267, -0.3224036, -2.80072, 1, 0.1372549, 0, 1,
-1.958197, 0.2201174, -2.749298, 1, 0.145098, 0, 1,
-1.935952, -0.1647306, -1.530113, 1, 0.1490196, 0, 1,
-1.93374, -0.2284168, -4.203649, 1, 0.1568628, 0, 1,
-1.930701, 0.8702601, -0.5685604, 1, 0.1607843, 0, 1,
-1.914039, 0.3657646, -1.783852, 1, 0.1686275, 0, 1,
-1.912162, -0.8728352, -2.342248, 1, 0.172549, 0, 1,
-1.890733, 0.737958, -0.7759523, 1, 0.1803922, 0, 1,
-1.890293, 0.9905046, -0.2247106, 1, 0.1843137, 0, 1,
-1.858468, 1.051344, -1.975395, 1, 0.1921569, 0, 1,
-1.830649, 0.5923066, -2.075214, 1, 0.1960784, 0, 1,
-1.823013, 1.060353, -1.963991, 1, 0.2039216, 0, 1,
-1.783144, 0.03089275, -0.906526, 1, 0.2117647, 0, 1,
-1.778262, -0.2670753, -2.301023, 1, 0.2156863, 0, 1,
-1.757967, 0.06139105, -1.696598, 1, 0.2235294, 0, 1,
-1.749227, -0.4131225, -1.539296, 1, 0.227451, 0, 1,
-1.702809, -0.1578135, -1.55778, 1, 0.2352941, 0, 1,
-1.694091, 0.7769948, -0.6066227, 1, 0.2392157, 0, 1,
-1.676214, -0.2966658, -1.509872, 1, 0.2470588, 0, 1,
-1.661578, 0.3590169, 0.2793502, 1, 0.2509804, 0, 1,
-1.657805, -1.219532, -1.3661, 1, 0.2588235, 0, 1,
-1.656101, -0.3828656, -1.172912, 1, 0.2627451, 0, 1,
-1.647191, 2.102717, -0.7076795, 1, 0.2705882, 0, 1,
-1.59683, -0.07315209, -1.992637, 1, 0.2745098, 0, 1,
-1.571346, -0.01489107, -2.462053, 1, 0.282353, 0, 1,
-1.565887, 0.8015804, -1.478373, 1, 0.2862745, 0, 1,
-1.558797, 0.5758762, -2.536407, 1, 0.2941177, 0, 1,
-1.540411, -2.352013, -2.335721, 1, 0.3019608, 0, 1,
-1.533301, 0.4255604, -3.316226, 1, 0.3058824, 0, 1,
-1.531112, -2.301393, -2.285511, 1, 0.3137255, 0, 1,
-1.50896, -0.4283444, -1.235591, 1, 0.3176471, 0, 1,
-1.487332, 0.4189948, -0.5125704, 1, 0.3254902, 0, 1,
-1.474768, 2.587655, -0.5784236, 1, 0.3294118, 0, 1,
-1.472921, 1.254884, 0.1635736, 1, 0.3372549, 0, 1,
-1.461065, -1.552023, -3.525263, 1, 0.3411765, 0, 1,
-1.459525, 0.8255594, 0.5857604, 1, 0.3490196, 0, 1,
-1.434001, -0.3729211, -2.465705, 1, 0.3529412, 0, 1,
-1.426067, -1.398184, -2.602932, 1, 0.3607843, 0, 1,
-1.422968, -0.9093388, -1.764664, 1, 0.3647059, 0, 1,
-1.416529, -0.460232, -0.6522092, 1, 0.372549, 0, 1,
-1.407109, 0.6481273, -0.8068429, 1, 0.3764706, 0, 1,
-1.40585, 1.039475, -1.870987, 1, 0.3843137, 0, 1,
-1.402603, -0.4469618, -2.845164, 1, 0.3882353, 0, 1,
-1.396122, -0.4109826, -2.243272, 1, 0.3960784, 0, 1,
-1.395587, -1.560066, -2.790869, 1, 0.4039216, 0, 1,
-1.382654, 0.5643059, -3.256875, 1, 0.4078431, 0, 1,
-1.373884, -0.6378151, -2.825324, 1, 0.4156863, 0, 1,
-1.369258, 0.4067142, -2.081105, 1, 0.4196078, 0, 1,
-1.36619, 0.7904425, 0.381678, 1, 0.427451, 0, 1,
-1.363769, 0.1007785, -1.096666, 1, 0.4313726, 0, 1,
-1.360852, 0.02147659, -0.7300411, 1, 0.4392157, 0, 1,
-1.357877, 0.2137675, -1.631976, 1, 0.4431373, 0, 1,
-1.355757, -0.6527444, -2.507376, 1, 0.4509804, 0, 1,
-1.347096, 0.5325591, -1.478106, 1, 0.454902, 0, 1,
-1.34619, 0.1082246, -3.031978, 1, 0.4627451, 0, 1,
-1.336368, -0.7976509, -2.827204, 1, 0.4666667, 0, 1,
-1.324507, -1.045138, -0.03766954, 1, 0.4745098, 0, 1,
-1.318604, 1.319849, 0.194903, 1, 0.4784314, 0, 1,
-1.313807, 0.5233909, -1.403667, 1, 0.4862745, 0, 1,
-1.313626, 1.912049, -0.4601318, 1, 0.4901961, 0, 1,
-1.312011, 0.2354133, -0.4571309, 1, 0.4980392, 0, 1,
-1.306661, 0.393584, -0.9705102, 1, 0.5058824, 0, 1,
-1.293992, 0.3476719, -1.544235, 1, 0.509804, 0, 1,
-1.290172, 1.209637, -1.8983, 1, 0.5176471, 0, 1,
-1.288269, -2.753027, -2.429132, 1, 0.5215687, 0, 1,
-1.275403, 0.3186196, -1.659206, 1, 0.5294118, 0, 1,
-1.273986, 1.607975, -0.7964215, 1, 0.5333334, 0, 1,
-1.268684, 1.073224, -1.150845, 1, 0.5411765, 0, 1,
-1.266505, -1.432502, -3.053433, 1, 0.5450981, 0, 1,
-1.266402, -0.716381, -1.904125, 1, 0.5529412, 0, 1,
-1.265128, -1.137734, -2.155745, 1, 0.5568628, 0, 1,
-1.263373, -0.06886939, -2.820589, 1, 0.5647059, 0, 1,
-1.258095, 0.681258, -0.8978935, 1, 0.5686275, 0, 1,
-1.257931, 1.599209, -1.083561, 1, 0.5764706, 0, 1,
-1.254628, -1.790565, -3.59731, 1, 0.5803922, 0, 1,
-1.254258, 1.041286, -1.129855, 1, 0.5882353, 0, 1,
-1.252472, 1.095499, -0.2831718, 1, 0.5921569, 0, 1,
-1.242842, -0.5882069, -1.665195, 1, 0.6, 0, 1,
-1.241377, 0.1294119, -3.261122, 1, 0.6078432, 0, 1,
-1.236127, -0.320082, -2.387777, 1, 0.6117647, 0, 1,
-1.233899, 0.7878187, -1.337516, 1, 0.6196079, 0, 1,
-1.229501, 0.310779, -2.749666, 1, 0.6235294, 0, 1,
-1.228325, -0.4415275, -2.115103, 1, 0.6313726, 0, 1,
-1.215775, -0.3519496, -2.111007, 1, 0.6352941, 0, 1,
-1.215698, -0.6371874, -2.08874, 1, 0.6431373, 0, 1,
-1.206787, -0.659716, -2.775878, 1, 0.6470588, 0, 1,
-1.202932, -0.2701479, -0.3892781, 1, 0.654902, 0, 1,
-1.202052, 0.2013886, -0.9737207, 1, 0.6588235, 0, 1,
-1.198453, 1.388936, -2.546136, 1, 0.6666667, 0, 1,
-1.196297, 0.4121808, -0.6123642, 1, 0.6705883, 0, 1,
-1.193841, -0.5233425, -2.138717, 1, 0.6784314, 0, 1,
-1.19003, -1.475516, -3.806324, 1, 0.682353, 0, 1,
-1.189463, -0.3728946, -1.241938, 1, 0.6901961, 0, 1,
-1.17273, -0.8843108, -2.537582, 1, 0.6941177, 0, 1,
-1.171062, 1.527567, -1.668156, 1, 0.7019608, 0, 1,
-1.168199, 1.101496, -1.346994, 1, 0.7098039, 0, 1,
-1.16788, 0.3834974, -2.953816, 1, 0.7137255, 0, 1,
-1.157022, 1.307064, -0.7659946, 1, 0.7215686, 0, 1,
-1.156485, -0.6817754, -2.893127, 1, 0.7254902, 0, 1,
-1.152503, 1.06319, -1.784943, 1, 0.7333333, 0, 1,
-1.139065, -0.7112107, -2.26639, 1, 0.7372549, 0, 1,
-1.138972, 0.9115538, -2.681568, 1, 0.7450981, 0, 1,
-1.127362, -2.184815, -3.109973, 1, 0.7490196, 0, 1,
-1.127, -0.4113506, -3.444556, 1, 0.7568628, 0, 1,
-1.120948, -0.03894755, -0.6392599, 1, 0.7607843, 0, 1,
-1.117676, -0.5929005, -4.255967, 1, 0.7686275, 0, 1,
-1.103361, -1.256712, -3.242526, 1, 0.772549, 0, 1,
-1.101867, 0.5054513, -1.059406, 1, 0.7803922, 0, 1,
-1.093761, -0.5633017, -2.536256, 1, 0.7843137, 0, 1,
-1.085629, -0.6863572, -0.9220083, 1, 0.7921569, 0, 1,
-1.085457, 0.1002845, -1.624321, 1, 0.7960784, 0, 1,
-1.083482, 0.06273594, -3.47678, 1, 0.8039216, 0, 1,
-1.082558, -1.722041, -1.834248, 1, 0.8117647, 0, 1,
-1.077999, 2.578863, -0.279604, 1, 0.8156863, 0, 1,
-1.075703, -0.3519427, -1.29383, 1, 0.8235294, 0, 1,
-1.074135, 0.8942468, -1.39713, 1, 0.827451, 0, 1,
-1.070014, -2.00901, -4.431898, 1, 0.8352941, 0, 1,
-1.058121, -1.383009, -2.662179, 1, 0.8392157, 0, 1,
-1.054933, -1.313263, -2.988142, 1, 0.8470588, 0, 1,
-1.047815, 0.5285471, 0.4655963, 1, 0.8509804, 0, 1,
-1.038222, -0.8394378, -1.966632, 1, 0.8588235, 0, 1,
-1.033216, -0.1599167, -1.385486, 1, 0.8627451, 0, 1,
-1.028372, -0.7603099, -1.6413, 1, 0.8705882, 0, 1,
-1.025334, -0.04526959, -1.474021, 1, 0.8745098, 0, 1,
-1.019726, -0.07194545, -2.05575, 1, 0.8823529, 0, 1,
-1.006777, 0.7669668, -2.532283, 1, 0.8862745, 0, 1,
-0.9939177, -1.146053, -3.21998, 1, 0.8941177, 0, 1,
-0.9929969, -0.6059933, -1.843039, 1, 0.8980392, 0, 1,
-0.989396, -1.56611, -0.8318605, 1, 0.9058824, 0, 1,
-0.9857599, -0.3586028, -0.9929295, 1, 0.9137255, 0, 1,
-0.980092, -0.370269, -0.9501927, 1, 0.9176471, 0, 1,
-0.9797646, 0.1312352, -1.395863, 1, 0.9254902, 0, 1,
-0.9618064, 0.2544807, -0.789255, 1, 0.9294118, 0, 1,
-0.9613298, 0.6803265, -0.4361193, 1, 0.9372549, 0, 1,
-0.9485754, -0.6158214, -1.996078, 1, 0.9411765, 0, 1,
-0.9455076, -0.02582989, -0.4212787, 1, 0.9490196, 0, 1,
-0.9448427, -0.3545037, -0.7047619, 1, 0.9529412, 0, 1,
-0.9423378, 2.259732, -0.5224043, 1, 0.9607843, 0, 1,
-0.9420815, -0.1760861, -1.534707, 1, 0.9647059, 0, 1,
-0.9417486, -0.9850265, -3.662789, 1, 0.972549, 0, 1,
-0.9315912, 0.8400719, -1.729465, 1, 0.9764706, 0, 1,
-0.9291941, 0.2974051, 0.2171067, 1, 0.9843137, 0, 1,
-0.9289558, -0.1286008, -1.533769, 1, 0.9882353, 0, 1,
-0.9272649, -0.2480479, -1.51413, 1, 0.9960784, 0, 1,
-0.927153, -1.231029, -0.5911712, 0.9960784, 1, 0, 1,
-0.9256218, 1.256461, -1.211967, 0.9921569, 1, 0, 1,
-0.9172774, 0.7481246, -0.06288017, 0.9843137, 1, 0, 1,
-0.9087628, -0.7503322, -2.231817, 0.9803922, 1, 0, 1,
-0.9073445, -1.662617, -3.658838, 0.972549, 1, 0, 1,
-0.9045318, 1.074382, -0.4045385, 0.9686275, 1, 0, 1,
-0.9013587, -0.6415252, -3.616087, 0.9607843, 1, 0, 1,
-0.899789, 1.117644, -0.6872891, 0.9568627, 1, 0, 1,
-0.8808621, -1.150334, -3.681151, 0.9490196, 1, 0, 1,
-0.876361, -0.7851268, -2.255481, 0.945098, 1, 0, 1,
-0.8740539, -0.9047421, -1.527446, 0.9372549, 1, 0, 1,
-0.8718036, -1.370427, -2.246663, 0.9333333, 1, 0, 1,
-0.870137, -0.695694, -4.234907, 0.9254902, 1, 0, 1,
-0.8617991, -1.034369, -2.656479, 0.9215686, 1, 0, 1,
-0.8601081, -1.104705, -1.44585, 0.9137255, 1, 0, 1,
-0.8535448, -0.38239, -2.518371, 0.9098039, 1, 0, 1,
-0.8521983, 0.8405368, -0.1973359, 0.9019608, 1, 0, 1,
-0.8507981, 0.5396334, 0.1012701, 0.8941177, 1, 0, 1,
-0.84607, 0.4353058, -1.349828, 0.8901961, 1, 0, 1,
-0.8386441, -0.6149216, -1.942888, 0.8823529, 1, 0, 1,
-0.8379718, 0.7277026, -0.8861427, 0.8784314, 1, 0, 1,
-0.8273866, -1.285038, -2.338659, 0.8705882, 1, 0, 1,
-0.8213585, -1.386429, -1.891241, 0.8666667, 1, 0, 1,
-0.8194831, -0.3684672, -2.766526, 0.8588235, 1, 0, 1,
-0.818405, 0.001453039, -2.681587, 0.854902, 1, 0, 1,
-0.8174859, 2.016344, -0.584307, 0.8470588, 1, 0, 1,
-0.8143901, 1.537586, -0.4524765, 0.8431373, 1, 0, 1,
-0.8030578, 0.9366699, -0.9586499, 0.8352941, 1, 0, 1,
-0.7975975, -0.06133024, -1.009421, 0.8313726, 1, 0, 1,
-0.795014, -0.5600261, -3.307081, 0.8235294, 1, 0, 1,
-0.7854012, -0.4438281, -3.711058, 0.8196079, 1, 0, 1,
-0.7824875, 1.892414, -0.6882303, 0.8117647, 1, 0, 1,
-0.7779161, -0.2618348, -2.261612, 0.8078431, 1, 0, 1,
-0.7757829, 0.8040718, -0.2652322, 0.8, 1, 0, 1,
-0.7681646, 2.120355, -1.179364, 0.7921569, 1, 0, 1,
-0.7661235, 0.9660535, 0.1284969, 0.7882353, 1, 0, 1,
-0.7648344, 0.9459066, -0.7277505, 0.7803922, 1, 0, 1,
-0.7639894, 0.7241729, -1.673993, 0.7764706, 1, 0, 1,
-0.763735, -1.726357, -1.22981, 0.7686275, 1, 0, 1,
-0.7627307, -0.09953064, -3.842398, 0.7647059, 1, 0, 1,
-0.7622821, -0.1337889, -2.095548, 0.7568628, 1, 0, 1,
-0.7583114, -1.477894, -2.682199, 0.7529412, 1, 0, 1,
-0.7570748, -0.197501, -0.5007817, 0.7450981, 1, 0, 1,
-0.7457752, -1.411011, -1.821204, 0.7411765, 1, 0, 1,
-0.7355419, 1.957399, 0.205072, 0.7333333, 1, 0, 1,
-0.7351409, 0.2328452, -1.689526, 0.7294118, 1, 0, 1,
-0.729853, 0.7726971, -2.404208, 0.7215686, 1, 0, 1,
-0.7237909, -2.37313, -2.705779, 0.7176471, 1, 0, 1,
-0.7206451, 0.216841, -0.8879726, 0.7098039, 1, 0, 1,
-0.7177753, -0.007399875, -2.285488, 0.7058824, 1, 0, 1,
-0.7169103, -0.8419966, -2.122662, 0.6980392, 1, 0, 1,
-0.7146547, -1.226409, -2.481949, 0.6901961, 1, 0, 1,
-0.7136517, -0.1958123, -1.482277, 0.6862745, 1, 0, 1,
-0.710876, -0.8901267, 0.2864559, 0.6784314, 1, 0, 1,
-0.7070799, 0.6649171, 0.1993131, 0.6745098, 1, 0, 1,
-0.7050293, -0.1686351, -2.153213, 0.6666667, 1, 0, 1,
-0.7034901, 1.033894, -1.281351, 0.6627451, 1, 0, 1,
-0.7023993, -0.01896623, -0.7705194, 0.654902, 1, 0, 1,
-0.6995649, -0.1670706, -1.580577, 0.6509804, 1, 0, 1,
-0.6990658, 0.212159, -0.2547512, 0.6431373, 1, 0, 1,
-0.6926455, 0.670064, -1.533421, 0.6392157, 1, 0, 1,
-0.6921865, -0.1894692, -1.385814, 0.6313726, 1, 0, 1,
-0.6857305, 1.49989, -0.8040034, 0.627451, 1, 0, 1,
-0.6857196, -0.2718354, -2.634552, 0.6196079, 1, 0, 1,
-0.6838484, 0.7407573, 1.197212, 0.6156863, 1, 0, 1,
-0.6833534, -0.8591336, -2.767797, 0.6078432, 1, 0, 1,
-0.6803382, 0.4899191, -2.618, 0.6039216, 1, 0, 1,
-0.6755269, -1.112787, -3.705311, 0.5960785, 1, 0, 1,
-0.6667168, -2.412984, -3.214717, 0.5882353, 1, 0, 1,
-0.6626036, -0.3450182, -3.491025, 0.5843138, 1, 0, 1,
-0.6581516, 1.763386, -0.4742673, 0.5764706, 1, 0, 1,
-0.6577495, -0.6949769, -0.7974175, 0.572549, 1, 0, 1,
-0.6563698, -0.5696814, -1.109352, 0.5647059, 1, 0, 1,
-0.6546001, 1.618705, 0.975881, 0.5607843, 1, 0, 1,
-0.6517947, -1.54176, -2.521508, 0.5529412, 1, 0, 1,
-0.6455064, -0.1563001, -0.8841696, 0.5490196, 1, 0, 1,
-0.6314897, 0.9058517, 1.007017, 0.5411765, 1, 0, 1,
-0.6311465, 0.3700165, -0.9864344, 0.5372549, 1, 0, 1,
-0.6309451, -0.09093574, -2.778381, 0.5294118, 1, 0, 1,
-0.6308182, 0.2712548, -1.429806, 0.5254902, 1, 0, 1,
-0.6280777, -0.5071562, -2.091964, 0.5176471, 1, 0, 1,
-0.6246358, 0.115997, 0.9242129, 0.5137255, 1, 0, 1,
-0.6238291, -1.124159, -2.994918, 0.5058824, 1, 0, 1,
-0.6148421, 0.6707549, -1.31465, 0.5019608, 1, 0, 1,
-0.6142145, 1.087524, -1.083977, 0.4941176, 1, 0, 1,
-0.6132588, 0.8190992, -1.159145, 0.4862745, 1, 0, 1,
-0.6118229, 0.08196846, -2.60494, 0.4823529, 1, 0, 1,
-0.6080772, 1.839017, 0.6868806, 0.4745098, 1, 0, 1,
-0.6010033, 2.142671, 1.452617, 0.4705882, 1, 0, 1,
-0.6000752, -0.06521677, -1.187065, 0.4627451, 1, 0, 1,
-0.6000182, 2.430124, -0.3958312, 0.4588235, 1, 0, 1,
-0.5984808, -0.8563452, -3.896821, 0.4509804, 1, 0, 1,
-0.5979054, 0.1630426, -2.451464, 0.4470588, 1, 0, 1,
-0.5946004, 2.000922, -0.8625213, 0.4392157, 1, 0, 1,
-0.5929938, 0.2461908, -1.657016, 0.4352941, 1, 0, 1,
-0.5928829, -1.044858, -2.416811, 0.427451, 1, 0, 1,
-0.5867338, 0.9536411, -2.956248, 0.4235294, 1, 0, 1,
-0.5850477, 0.9031883, -0.2959608, 0.4156863, 1, 0, 1,
-0.57942, 0.8263491, -1.132345, 0.4117647, 1, 0, 1,
-0.5719014, 0.3004125, -2.259732, 0.4039216, 1, 0, 1,
-0.5614499, 0.8229862, -1.648776, 0.3960784, 1, 0, 1,
-0.5503658, -1.556061, -0.9954324, 0.3921569, 1, 0, 1,
-0.5483735, -0.1318994, -2.413576, 0.3843137, 1, 0, 1,
-0.547834, -0.08093166, 0.6285361, 0.3803922, 1, 0, 1,
-0.5456466, 2.417325, 1.057678, 0.372549, 1, 0, 1,
-0.5432357, 0.001814863, -1.602092, 0.3686275, 1, 0, 1,
-0.5399709, 1.84211, 0.9791016, 0.3607843, 1, 0, 1,
-0.5334594, -1.900165, -2.069369, 0.3568628, 1, 0, 1,
-0.5288282, 0.1523539, -2.28761, 0.3490196, 1, 0, 1,
-0.5271191, -0.02474431, -2.073382, 0.345098, 1, 0, 1,
-0.5261921, 1.704978, 0.1738677, 0.3372549, 1, 0, 1,
-0.5244234, 0.6726521, -0.5948182, 0.3333333, 1, 0, 1,
-0.5216172, -0.5965248, -2.517105, 0.3254902, 1, 0, 1,
-0.5198935, -0.9394891, -2.113255, 0.3215686, 1, 0, 1,
-0.5159101, -0.111406, -1.403943, 0.3137255, 1, 0, 1,
-0.5126392, -0.09451795, -2.144087, 0.3098039, 1, 0, 1,
-0.5103028, 0.6099722, -1.651674, 0.3019608, 1, 0, 1,
-0.5071373, -0.9934954, -4.384731, 0.2941177, 1, 0, 1,
-0.5069453, 0.05297647, -1.967601, 0.2901961, 1, 0, 1,
-0.5020071, 0.475944, -0.9981706, 0.282353, 1, 0, 1,
-0.4994901, 0.6163117, -0.3403174, 0.2784314, 1, 0, 1,
-0.496009, 0.8563424, 1.153688, 0.2705882, 1, 0, 1,
-0.4959495, 1.19742, 0.2603736, 0.2666667, 1, 0, 1,
-0.4907624, 0.3351722, 0.008962913, 0.2588235, 1, 0, 1,
-0.4875695, -1.016059, -1.661364, 0.254902, 1, 0, 1,
-0.485809, 1.485561, 0.299294, 0.2470588, 1, 0, 1,
-0.4846721, -0.3693628, -1.22126, 0.2431373, 1, 0, 1,
-0.4835064, -1.27115, -3.710419, 0.2352941, 1, 0, 1,
-0.4831352, -0.4683686, -2.468321, 0.2313726, 1, 0, 1,
-0.4781582, 0.4270022, -2.113091, 0.2235294, 1, 0, 1,
-0.4731467, 0.8526509, -0.5083496, 0.2196078, 1, 0, 1,
-0.4671008, 1.758098, -0.1820707, 0.2117647, 1, 0, 1,
-0.4665589, 1.644369, 0.6079867, 0.2078431, 1, 0, 1,
-0.4663043, 0.5398505, -1.525558, 0.2, 1, 0, 1,
-0.4629713, 1.179994, 0.6963791, 0.1921569, 1, 0, 1,
-0.4591656, 1.184381, -0.6741696, 0.1882353, 1, 0, 1,
-0.4556537, -1.557253, -3.026601, 0.1803922, 1, 0, 1,
-0.4510666, 1.764837, -0.01030435, 0.1764706, 1, 0, 1,
-0.4472754, -0.8480257, -3.687349, 0.1686275, 1, 0, 1,
-0.444362, -0.8452111, -3.59965, 0.1647059, 1, 0, 1,
-0.4386587, 0.8245599, -2.032383, 0.1568628, 1, 0, 1,
-0.4386067, 2.004661, -0.17931, 0.1529412, 1, 0, 1,
-0.4385816, 0.5499508, -1.981844, 0.145098, 1, 0, 1,
-0.4357055, 1.288058, 0.3439383, 0.1411765, 1, 0, 1,
-0.4347234, -0.01952454, -1.533378, 0.1333333, 1, 0, 1,
-0.4328975, -0.301829, -0.5757341, 0.1294118, 1, 0, 1,
-0.4325063, 1.272882, 1.697017, 0.1215686, 1, 0, 1,
-0.4317812, -0.7641027, -1.797349, 0.1176471, 1, 0, 1,
-0.4317627, -0.7850701, -3.546347, 0.1098039, 1, 0, 1,
-0.4291991, -0.05632884, -2.335281, 0.1058824, 1, 0, 1,
-0.4257138, 0.5548923, -1.048652, 0.09803922, 1, 0, 1,
-0.4256397, 1.933396, -2.019277, 0.09019608, 1, 0, 1,
-0.4252784, -1.424508, -2.959672, 0.08627451, 1, 0, 1,
-0.4252593, 1.13944, -0.3157535, 0.07843138, 1, 0, 1,
-0.4219653, -0.7968968, -2.134676, 0.07450981, 1, 0, 1,
-0.4170074, 0.4419049, -0.2972952, 0.06666667, 1, 0, 1,
-0.4146169, -0.5391164, -1.449599, 0.0627451, 1, 0, 1,
-0.4128487, 1.294381, -0.105881, 0.05490196, 1, 0, 1,
-0.4102939, 0.4015159, -0.4821756, 0.05098039, 1, 0, 1,
-0.4096968, -0.2659916, -4.301034, 0.04313726, 1, 0, 1,
-0.4096868, 0.6326052, -2.061358, 0.03921569, 1, 0, 1,
-0.408931, -0.5126281, -4.138356, 0.03137255, 1, 0, 1,
-0.4070382, 0.2481448, -0.2984419, 0.02745098, 1, 0, 1,
-0.4058917, 1.34726, -0.06536423, 0.01960784, 1, 0, 1,
-0.4009806, -1.042956, -3.216371, 0.01568628, 1, 0, 1,
-0.3973893, 0.9617155, -1.132609, 0.007843138, 1, 0, 1,
-0.3870671, 1.553275, -2.546978, 0.003921569, 1, 0, 1,
-0.3852398, 1.094186, -1.161018, 0, 1, 0.003921569, 1,
-0.3816172, 1.425205, 1.635918, 0, 1, 0.01176471, 1,
-0.3803947, 0.1808828, -0.8973059, 0, 1, 0.01568628, 1,
-0.3799784, 0.30084, -2.456338, 0, 1, 0.02352941, 1,
-0.3777381, 0.5045566, 1.107854, 0, 1, 0.02745098, 1,
-0.3692894, -0.2710318, -2.116296, 0, 1, 0.03529412, 1,
-0.368209, 0.4158812, -0.7470738, 0, 1, 0.03921569, 1,
-0.3644295, 0.008616366, -2.684854, 0, 1, 0.04705882, 1,
-0.364413, 0.6025105, 1.345073, 0, 1, 0.05098039, 1,
-0.3642041, 0.2967389, -0.4534506, 0, 1, 0.05882353, 1,
-0.3625257, 0.9003073, 0.8632951, 0, 1, 0.0627451, 1,
-0.3624144, 2.464445, -0.4680973, 0, 1, 0.07058824, 1,
-0.3609244, 0.4345716, -3.704808, 0, 1, 0.07450981, 1,
-0.3589379, -0.5117362, -2.242602, 0, 1, 0.08235294, 1,
-0.3573686, -0.4263534, -4.095939, 0, 1, 0.08627451, 1,
-0.3555935, -0.9490473, -2.391382, 0, 1, 0.09411765, 1,
-0.3533935, 0.674476, -0.2547839, 0, 1, 0.1019608, 1,
-0.3519377, -1.531912, -3.212097, 0, 1, 0.1058824, 1,
-0.3515403, -1.430912, -4.227624, 0, 1, 0.1137255, 1,
-0.3457014, 0.8167089, -0.4889328, 0, 1, 0.1176471, 1,
-0.3446696, 0.5701231, 1.056366, 0, 1, 0.1254902, 1,
-0.3438076, -0.6663079, -2.918419, 0, 1, 0.1294118, 1,
-0.3407055, 1.024523, 0.5653288, 0, 1, 0.1372549, 1,
-0.3405743, -1.084604, -3.651798, 0, 1, 0.1411765, 1,
-0.3387804, -0.4993119, -1.157139, 0, 1, 0.1490196, 1,
-0.3299613, 0.5495486, -1.863856, 0, 1, 0.1529412, 1,
-0.3297351, 0.2598236, -0.2844816, 0, 1, 0.1607843, 1,
-0.329213, 1.513717, -0.2055514, 0, 1, 0.1647059, 1,
-0.3263533, -1.601908, -2.735547, 0, 1, 0.172549, 1,
-0.3246819, -0.254728, -0.9916294, 0, 1, 0.1764706, 1,
-0.3187546, -1.168602, -3.403375, 0, 1, 0.1843137, 1,
-0.3186817, -0.5704767, -2.147338, 0, 1, 0.1882353, 1,
-0.3156001, -0.2586638, -2.068132, 0, 1, 0.1960784, 1,
-0.3149355, -1.074355, -2.114311, 0, 1, 0.2039216, 1,
-0.3140872, -1.614313, -1.665415, 0, 1, 0.2078431, 1,
-0.3083691, 0.9693068, -0.5634906, 0, 1, 0.2156863, 1,
-0.3074033, 2.52985, -1.779068, 0, 1, 0.2196078, 1,
-0.3065883, 0.6005112, -0.2269796, 0, 1, 0.227451, 1,
-0.3039137, -0.4754762, -3.342153, 0, 1, 0.2313726, 1,
-0.3000153, 1.701035, 1.392657, 0, 1, 0.2392157, 1,
-0.2979307, -1.764152, -2.68352, 0, 1, 0.2431373, 1,
-0.2951142, 0.4625998, -0.6231699, 0, 1, 0.2509804, 1,
-0.2942213, 0.2994028, 1.0668, 0, 1, 0.254902, 1,
-0.2939052, -1.632041, -1.162748, 0, 1, 0.2627451, 1,
-0.2892658, 0.1476659, -1.486622, 0, 1, 0.2666667, 1,
-0.2888656, 0.3144936, 0.6368646, 0, 1, 0.2745098, 1,
-0.2869167, -1.491679, -1.561532, 0, 1, 0.2784314, 1,
-0.2865567, -0.114731, -1.489295, 0, 1, 0.2862745, 1,
-0.2857774, 1.132222, 1.147797, 0, 1, 0.2901961, 1,
-0.2846449, -0.1927313, -2.290424, 0, 1, 0.2980392, 1,
-0.2821739, 1.713405, 0.3835442, 0, 1, 0.3058824, 1,
-0.2767476, -0.3678219, -4.510757, 0, 1, 0.3098039, 1,
-0.2753555, 1.243246, -0.1411098, 0, 1, 0.3176471, 1,
-0.2736368, 0.2129238, -1.480691, 0, 1, 0.3215686, 1,
-0.2677839, 0.9551786, -0.210025, 0, 1, 0.3294118, 1,
-0.2672753, 0.9886431, -1.261432, 0, 1, 0.3333333, 1,
-0.2663595, 0.2568415, -0.01715701, 0, 1, 0.3411765, 1,
-0.2662058, -0.09140027, -2.898362, 0, 1, 0.345098, 1,
-0.2653431, -1.561397, -3.470685, 0, 1, 0.3529412, 1,
-0.2586161, -0.5098115, -1.712735, 0, 1, 0.3568628, 1,
-0.2546249, 1.391342, -0.1428528, 0, 1, 0.3647059, 1,
-0.252215, -1.395569, -4.113381, 0, 1, 0.3686275, 1,
-0.2514817, 0.8597426, -0.0005523934, 0, 1, 0.3764706, 1,
-0.2497763, -0.8030186, -2.420752, 0, 1, 0.3803922, 1,
-0.2491519, -1.453164, -2.955606, 0, 1, 0.3882353, 1,
-0.2489157, -0.006265594, -3.431741, 0, 1, 0.3921569, 1,
-0.2438658, 2.431244, 0.2959018, 0, 1, 0.4, 1,
-0.2393597, 2.208175, -1.052622, 0, 1, 0.4078431, 1,
-0.2387275, 0.4516949, 0.3393082, 0, 1, 0.4117647, 1,
-0.2281876, -0.1087707, -2.421315, 0, 1, 0.4196078, 1,
-0.2237798, 0.4911199, -2.037452, 0, 1, 0.4235294, 1,
-0.2188975, 0.3176714, 0.007789116, 0, 1, 0.4313726, 1,
-0.215782, 1.155529, 0.5684676, 0, 1, 0.4352941, 1,
-0.2144424, 1.231917, 0.5682725, 0, 1, 0.4431373, 1,
-0.2141214, 1.653449, 0.7620554, 0, 1, 0.4470588, 1,
-0.2136043, -2.18617, -3.279247, 0, 1, 0.454902, 1,
-0.2133276, 0.3603095, -0.189137, 0, 1, 0.4588235, 1,
-0.2093903, -1.065455, -4.257382, 0, 1, 0.4666667, 1,
-0.2072293, 0.1729523, -0.7885577, 0, 1, 0.4705882, 1,
-0.2060278, -0.3796839, -2.750209, 0, 1, 0.4784314, 1,
-0.2059764, -1.228151, -1.589333, 0, 1, 0.4823529, 1,
-0.2021787, -1.598169, -3.228498, 0, 1, 0.4901961, 1,
-0.2017202, -0.8239001, -3.60088, 0, 1, 0.4941176, 1,
-0.2000817, 1.024899, -1.29611, 0, 1, 0.5019608, 1,
-0.1999858, 0.5913702, 1.657029, 0, 1, 0.509804, 1,
-0.1986034, 0.4799385, -1.822995, 0, 1, 0.5137255, 1,
-0.1971248, -0.4557174, -2.241213, 0, 1, 0.5215687, 1,
-0.1924343, 1.055862, -0.09355084, 0, 1, 0.5254902, 1,
-0.190854, -1.391655, -2.593068, 0, 1, 0.5333334, 1,
-0.1881058, 2.405957, 0.3699931, 0, 1, 0.5372549, 1,
-0.1872088, 0.1585419, -0.945398, 0, 1, 0.5450981, 1,
-0.1843095, -0.7669684, -4.199686, 0, 1, 0.5490196, 1,
-0.1817624, 1.232592, -0.1606271, 0, 1, 0.5568628, 1,
-0.1808803, 0.6844593, 0.6857629, 0, 1, 0.5607843, 1,
-0.1808099, -0.342875, -2.413962, 0, 1, 0.5686275, 1,
-0.1781349, -2.553009, -3.51864, 0, 1, 0.572549, 1,
-0.1737984, 1.344722, 0.318114, 0, 1, 0.5803922, 1,
-0.1640133, 1.884989, 0.06198894, 0, 1, 0.5843138, 1,
-0.163352, -0.446338, -1.932668, 0, 1, 0.5921569, 1,
-0.163292, 2.492541, 0.07338569, 0, 1, 0.5960785, 1,
-0.1626151, 0.1589094, -0.6590456, 0, 1, 0.6039216, 1,
-0.1624752, -0.3382507, -2.638878, 0, 1, 0.6117647, 1,
-0.159126, -1.158026, -3.090204, 0, 1, 0.6156863, 1,
-0.1590537, -1.131586, -1.162549, 0, 1, 0.6235294, 1,
-0.1588693, -0.00600338, -0.3775612, 0, 1, 0.627451, 1,
-0.1560256, -0.1150687, -3.949338, 0, 1, 0.6352941, 1,
-0.1547204, -0.2488691, -1.894869, 0, 1, 0.6392157, 1,
-0.1466128, 0.2885067, -1.357811, 0, 1, 0.6470588, 1,
-0.144173, 0.6986182, -1.84273, 0, 1, 0.6509804, 1,
-0.1439532, 0.02299567, -2.351925, 0, 1, 0.6588235, 1,
-0.1433782, -0.9392843, -2.950563, 0, 1, 0.6627451, 1,
-0.141831, 0.4714831, -0.2225054, 0, 1, 0.6705883, 1,
-0.1410921, 0.1005087, -0.6338146, 0, 1, 0.6745098, 1,
-0.1405478, 2.974278, 1.110117, 0, 1, 0.682353, 1,
-0.1385341, -1.102129, -2.772078, 0, 1, 0.6862745, 1,
-0.1376962, 1.41539, 2.157453, 0, 1, 0.6941177, 1,
-0.1375315, 0.4823924, 0.2432193, 0, 1, 0.7019608, 1,
-0.1373179, -1.33926, -3.731083, 0, 1, 0.7058824, 1,
-0.1372342, 0.03797149, -3.265812, 0, 1, 0.7137255, 1,
-0.1360399, -0.819307, -4.557036, 0, 1, 0.7176471, 1,
-0.133141, 0.2530015, 0.2224515, 0, 1, 0.7254902, 1,
-0.1328408, 0.5675258, -0.9564486, 0, 1, 0.7294118, 1,
-0.1324138, -0.5747283, -5.158033, 0, 1, 0.7372549, 1,
-0.1310205, 0.09455541, -0.451916, 0, 1, 0.7411765, 1,
-0.1283828, 0.2846897, 1.158726, 0, 1, 0.7490196, 1,
-0.1279887, -0.4462709, -2.591602, 0, 1, 0.7529412, 1,
-0.1279032, -1.298882, -2.886989, 0, 1, 0.7607843, 1,
-0.1261059, 1.956046, -1.932576, 0, 1, 0.7647059, 1,
-0.1228047, -0.4379623, -3.436342, 0, 1, 0.772549, 1,
-0.1209943, -2.435635, -2.853843, 0, 1, 0.7764706, 1,
-0.1199238, -1.01899, -2.515992, 0, 1, 0.7843137, 1,
-0.1170642, -0.1081149, -2.029802, 0, 1, 0.7882353, 1,
-0.1137494, -0.2874852, -1.174061, 0, 1, 0.7960784, 1,
-0.1086278, -0.6128222, -3.855167, 0, 1, 0.8039216, 1,
-0.09668553, 0.4850041, -1.074056, 0, 1, 0.8078431, 1,
-0.08893779, -0.3824328, -1.509554, 0, 1, 0.8156863, 1,
-0.0866501, 0.1735104, -1.050216, 0, 1, 0.8196079, 1,
-0.08655573, 0.1706872, -0.6810427, 0, 1, 0.827451, 1,
-0.0826845, 0.1218821, -0.4239288, 0, 1, 0.8313726, 1,
-0.08032698, -0.5472884, -1.941168, 0, 1, 0.8392157, 1,
-0.07719319, 0.3666347, -0.4969009, 0, 1, 0.8431373, 1,
-0.07676592, -0.4314329, -2.319638, 0, 1, 0.8509804, 1,
-0.07619575, 0.8851891, -2.791633, 0, 1, 0.854902, 1,
-0.07570337, -0.9122603, -3.229018, 0, 1, 0.8627451, 1,
-0.07489835, 0.3170651, 0.7218511, 0, 1, 0.8666667, 1,
-0.072293, 2.210299, -0.7450505, 0, 1, 0.8745098, 1,
-0.07208019, -0.3110056, -5.214663, 0, 1, 0.8784314, 1,
-0.07032482, -0.5185955, -4.41689, 0, 1, 0.8862745, 1,
-0.06803416, -1.970165, -3.58698, 0, 1, 0.8901961, 1,
-0.0652406, 1.086653, -0.7419059, 0, 1, 0.8980392, 1,
-0.06499852, 0.01207129, -2.065899, 0, 1, 0.9058824, 1,
-0.06468642, -1.393499, -3.073856, 0, 1, 0.9098039, 1,
-0.06403253, -0.6096355, -1.903628, 0, 1, 0.9176471, 1,
-0.06358954, -0.03174772, -0.7429432, 0, 1, 0.9215686, 1,
-0.06118479, 0.4030834, -0.7488918, 0, 1, 0.9294118, 1,
-0.05942633, -0.2779355, -2.713555, 0, 1, 0.9333333, 1,
-0.05773487, 0.4345796, 0.742679, 0, 1, 0.9411765, 1,
-0.05720778, 1.353533, 0.04368933, 0, 1, 0.945098, 1,
-0.05594848, -0.9363605, -2.206435, 0, 1, 0.9529412, 1,
-0.05588613, 0.947641, -1.177273, 0, 1, 0.9568627, 1,
-0.05577584, 1.233263, 0.1337689, 0, 1, 0.9647059, 1,
-0.04725364, 1.046242, 0.5945999, 0, 1, 0.9686275, 1,
-0.04368382, -0.3327347, -2.827268, 0, 1, 0.9764706, 1,
-0.04163263, -0.5121372, -2.522905, 0, 1, 0.9803922, 1,
-0.04027585, 0.8125736, -0.9762632, 0, 1, 0.9882353, 1,
-0.03752271, -0.5597016, -2.64219, 0, 1, 0.9921569, 1,
-0.03655133, -1.133494, -4.22928, 0, 1, 1, 1,
-0.03599104, -0.5072801, -1.504942, 0, 0.9921569, 1, 1,
-0.03527021, 0.135842, 1.854901, 0, 0.9882353, 1, 1,
-0.0269951, -1.463256, -3.816221, 0, 0.9803922, 1, 1,
-0.02571269, 0.5453627, 0.03695596, 0, 0.9764706, 1, 1,
-0.02182722, -1.107472, -3.304575, 0, 0.9686275, 1, 1,
-0.01355733, -0.04021375, -3.783545, 0, 0.9647059, 1, 1,
-0.008465089, -0.6839727, -2.629849, 0, 0.9568627, 1, 1,
-0.003526717, -1.216843, -0.9107714, 0, 0.9529412, 1, 1,
-0.003336043, 0.3253521, 0.3038183, 0, 0.945098, 1, 1,
0.0006404926, -1.441057, 3.866728, 0, 0.9411765, 1, 1,
0.00590128, -0.2623972, 3.042474, 0, 0.9333333, 1, 1,
0.006121519, -1.667176, 4.754503, 0, 0.9294118, 1, 1,
0.01132615, 0.1482161, -0.04355757, 0, 0.9215686, 1, 1,
0.01366888, 0.1256169, -1.485031, 0, 0.9176471, 1, 1,
0.01463986, -0.008097804, 2.755342, 0, 0.9098039, 1, 1,
0.01935666, -1.511965, 2.615854, 0, 0.9058824, 1, 1,
0.0201773, 1.05833, 1.001334, 0, 0.8980392, 1, 1,
0.02129941, 0.7439731, 0.1030179, 0, 0.8901961, 1, 1,
0.02433278, -0.7667335, 2.592137, 0, 0.8862745, 1, 1,
0.02608557, 1.892057, 0.9599199, 0, 0.8784314, 1, 1,
0.02610247, 1.746351, 1.625391, 0, 0.8745098, 1, 1,
0.02892243, 0.3694875, -0.2601047, 0, 0.8666667, 1, 1,
0.03148648, 1.128504, -0.7256277, 0, 0.8627451, 1, 1,
0.03341372, -0.3507617, 2.117992, 0, 0.854902, 1, 1,
0.03729165, 0.5845595, 0.882436, 0, 0.8509804, 1, 1,
0.03781945, 0.9483181, -1.017059, 0, 0.8431373, 1, 1,
0.03998009, -0.5053756, 3.557399, 0, 0.8392157, 1, 1,
0.04608018, 0.5247561, -0.3986077, 0, 0.8313726, 1, 1,
0.04983193, 0.8919272, -1.819533, 0, 0.827451, 1, 1,
0.05060251, -0.005643743, 0.3124372, 0, 0.8196079, 1, 1,
0.05188295, -1.668288, 4.306377, 0, 0.8156863, 1, 1,
0.0546147, 0.0764327, 0.4541196, 0, 0.8078431, 1, 1,
0.05585438, 0.4473383, 2.211623, 0, 0.8039216, 1, 1,
0.05882963, -0.8212258, 1.653412, 0, 0.7960784, 1, 1,
0.05989285, -1.377335, 4.826905, 0, 0.7882353, 1, 1,
0.06064999, -0.542698, 4.140326, 0, 0.7843137, 1, 1,
0.06823338, 0.04319457, 1.017421, 0, 0.7764706, 1, 1,
0.07181993, 0.5426131, -1.324706, 0, 0.772549, 1, 1,
0.07226655, 0.1061532, -0.8296413, 0, 0.7647059, 1, 1,
0.0727586, -1.687219, 3.810685, 0, 0.7607843, 1, 1,
0.07515302, -0.698289, 1.895289, 0, 0.7529412, 1, 1,
0.07758211, -0.9862232, 2.990186, 0, 0.7490196, 1, 1,
0.08797964, -1.481305, 2.953304, 0, 0.7411765, 1, 1,
0.08849926, 1.397717, 0.5933296, 0, 0.7372549, 1, 1,
0.09019586, 0.5105674, -2.298802, 0, 0.7294118, 1, 1,
0.09308839, 0.7699798, -0.5161605, 0, 0.7254902, 1, 1,
0.09460023, 1.905548, -1.495591, 0, 0.7176471, 1, 1,
0.1049594, 0.1584665, 1.47401, 0, 0.7137255, 1, 1,
0.1069876, 1.240094, -0.7812522, 0, 0.7058824, 1, 1,
0.1086862, -1.246172, 2.104495, 0, 0.6980392, 1, 1,
0.1113199, -0.6124716, 3.749796, 0, 0.6941177, 1, 1,
0.115729, -0.3529421, 1.562415, 0, 0.6862745, 1, 1,
0.1187549, -3.06692, 3.333365, 0, 0.682353, 1, 1,
0.1214289, 0.7248845, 0.8561763, 0, 0.6745098, 1, 1,
0.1227831, 0.2974228, -0.197262, 0, 0.6705883, 1, 1,
0.1271973, 0.6115984, 2.048575, 0, 0.6627451, 1, 1,
0.1276135, -0.1468887, 2.193821, 0, 0.6588235, 1, 1,
0.1280331, -0.01739088, 1.192546, 0, 0.6509804, 1, 1,
0.1304176, -2.873172, 6.102667, 0, 0.6470588, 1, 1,
0.1330844, 1.520578, 0.6045969, 0, 0.6392157, 1, 1,
0.1339819, -0.4144583, 2.237225, 0, 0.6352941, 1, 1,
0.1343206, 0.8603144, 1.146971, 0, 0.627451, 1, 1,
0.1372645, 0.2392346, 0.04616345, 0, 0.6235294, 1, 1,
0.1373542, -1.401294, 3.167993, 0, 0.6156863, 1, 1,
0.1410122, 0.3872383, -0.032825, 0, 0.6117647, 1, 1,
0.1423585, -0.1658397, 2.25711, 0, 0.6039216, 1, 1,
0.1453264, 1.156757, -0.1054905, 0, 0.5960785, 1, 1,
0.1492653, -0.4886194, 1.698594, 0, 0.5921569, 1, 1,
0.1519325, -1.777337, 2.241431, 0, 0.5843138, 1, 1,
0.1534642, -1.060391, 2.356768, 0, 0.5803922, 1, 1,
0.1536074, 0.9464048, 0.1610276, 0, 0.572549, 1, 1,
0.1540053, 0.5724367, 0.2190733, 0, 0.5686275, 1, 1,
0.1569015, -1.305027, 6.257231, 0, 0.5607843, 1, 1,
0.1572106, -1.012204, 3.263428, 0, 0.5568628, 1, 1,
0.1588142, 0.4122374, 0.8541738, 0, 0.5490196, 1, 1,
0.1632188, 0.7869661, -0.9084987, 0, 0.5450981, 1, 1,
0.1649956, -0.6962115, 2.423419, 0, 0.5372549, 1, 1,
0.1669035, -0.01205093, 0.9233717, 0, 0.5333334, 1, 1,
0.1705156, 0.2151929, 0.6212406, 0, 0.5254902, 1, 1,
0.1741161, -0.6736451, 4.737925, 0, 0.5215687, 1, 1,
0.174521, 1.124795, 0.384536, 0, 0.5137255, 1, 1,
0.1749507, 1.821191, 1.624888, 0, 0.509804, 1, 1,
0.1768881, -0.1314464, 1.117393, 0, 0.5019608, 1, 1,
0.1783769, 1.440734, -0.1475102, 0, 0.4941176, 1, 1,
0.1787659, 1.015016, -0.7641348, 0, 0.4901961, 1, 1,
0.1855213, -0.3808114, 3.165624, 0, 0.4823529, 1, 1,
0.1873699, -1.445879, 1.185681, 0, 0.4784314, 1, 1,
0.187473, 1.365085, 0.3939147, 0, 0.4705882, 1, 1,
0.1882972, 2.134431, 0.4538752, 0, 0.4666667, 1, 1,
0.1885396, -1.156319, 4.504709, 0, 0.4588235, 1, 1,
0.1929414, -1.834782, 2.554412, 0, 0.454902, 1, 1,
0.1990428, -0.4518791, 2.745785, 0, 0.4470588, 1, 1,
0.2003912, -0.8771365, 4.322969, 0, 0.4431373, 1, 1,
0.2004967, 2.82028, -0.4270557, 0, 0.4352941, 1, 1,
0.2033198, 0.7588052, -0.1390161, 0, 0.4313726, 1, 1,
0.2066127, 0.24221, -0.0516538, 0, 0.4235294, 1, 1,
0.20833, 0.2173516, 0.7562141, 0, 0.4196078, 1, 1,
0.2086316, -1.865017, 2.265923, 0, 0.4117647, 1, 1,
0.2129202, -0.9007192, 1.589074, 0, 0.4078431, 1, 1,
0.2164937, 0.1997591, 1.688399, 0, 0.4, 1, 1,
0.2232533, -0.951493, 3.316956, 0, 0.3921569, 1, 1,
0.2256098, 0.4290311, 0.05203104, 0, 0.3882353, 1, 1,
0.2271284, 0.9964001, -0.08355158, 0, 0.3803922, 1, 1,
0.2309334, 0.07417118, 2.836351, 0, 0.3764706, 1, 1,
0.2344854, 0.6519724, -0.4510455, 0, 0.3686275, 1, 1,
0.2359123, 1.27316, -0.7872466, 0, 0.3647059, 1, 1,
0.2359728, 0.9527156, 1.789294, 0, 0.3568628, 1, 1,
0.2395837, 0.5984705, -1.285043, 0, 0.3529412, 1, 1,
0.2433574, -0.168815, 2.059053, 0, 0.345098, 1, 1,
0.2444452, -0.08141427, 1.787966, 0, 0.3411765, 1, 1,
0.2504453, 0.1795789, 0.4735091, 0, 0.3333333, 1, 1,
0.2511052, 0.8508436, -0.7015916, 0, 0.3294118, 1, 1,
0.252519, -1.994978, 3.417284, 0, 0.3215686, 1, 1,
0.256315, 1.732487, 0.9438067, 0, 0.3176471, 1, 1,
0.2580373, -0.4576147, 3.663591, 0, 0.3098039, 1, 1,
0.2608906, 0.1274828, 1.043501, 0, 0.3058824, 1, 1,
0.2639425, 0.6294331, 0.1070961, 0, 0.2980392, 1, 1,
0.2664448, 0.4051562, -0.1345602, 0, 0.2901961, 1, 1,
0.267598, 0.9716319, 0.4137575, 0, 0.2862745, 1, 1,
0.2696835, -1.364319, 5.515362, 0, 0.2784314, 1, 1,
0.2779276, -0.9885745, 3.564845, 0, 0.2745098, 1, 1,
0.2855607, -0.355685, 1.072262, 0, 0.2666667, 1, 1,
0.286053, 0.07406056, 1.516825, 0, 0.2627451, 1, 1,
0.2899927, -1.472616, 3.088526, 0, 0.254902, 1, 1,
0.2932511, -0.1933246, 1.084987, 0, 0.2509804, 1, 1,
0.3016134, -0.6647888, 3.575102, 0, 0.2431373, 1, 1,
0.3047235, -0.9088407, 1.912565, 0, 0.2392157, 1, 1,
0.3076484, -1.090496, 2.770247, 0, 0.2313726, 1, 1,
0.3076928, 0.7398429, -0.1271731, 0, 0.227451, 1, 1,
0.3100791, -0.6404873, 2.465579, 0, 0.2196078, 1, 1,
0.3131752, 0.396602, 1.808137, 0, 0.2156863, 1, 1,
0.317082, -0.3728712, 0.7097016, 0, 0.2078431, 1, 1,
0.3180121, 1.042539, -0.1376352, 0, 0.2039216, 1, 1,
0.3188615, 0.8682714, 0.2415369, 0, 0.1960784, 1, 1,
0.3213688, -2.130356, 1.989872, 0, 0.1882353, 1, 1,
0.3237251, -0.1092249, 2.878201, 0, 0.1843137, 1, 1,
0.3241879, 1.23918, 0.5997888, 0, 0.1764706, 1, 1,
0.3251721, 0.008230274, 2.946142, 0, 0.172549, 1, 1,
0.3259658, -1.871829, 5.125327, 0, 0.1647059, 1, 1,
0.3297495, 0.2997721, -0.100628, 0, 0.1607843, 1, 1,
0.3337456, 0.4298921, 0.3442805, 0, 0.1529412, 1, 1,
0.3442656, -1.309106, 3.115696, 0, 0.1490196, 1, 1,
0.3447645, 0.2813542, 1.854686, 0, 0.1411765, 1, 1,
0.3494934, 0.7750266, 2.006424, 0, 0.1372549, 1, 1,
0.3507812, -1.498246, 3.80361, 0, 0.1294118, 1, 1,
0.3531213, 0.2239647, 1.350898, 0, 0.1254902, 1, 1,
0.3552347, -1.703858, 4.133632, 0, 0.1176471, 1, 1,
0.3576327, 0.2015483, 2.590681, 0, 0.1137255, 1, 1,
0.3577277, -0.4581763, 4.446683, 0, 0.1058824, 1, 1,
0.3653653, -0.1504607, 2.238728, 0, 0.09803922, 1, 1,
0.3690065, -1.384387, 3.347484, 0, 0.09411765, 1, 1,
0.3696669, 0.1005777, 1.337853, 0, 0.08627451, 1, 1,
0.3712565, -0.4568875, 3.295861, 0, 0.08235294, 1, 1,
0.3731105, 0.1509042, 1.351076, 0, 0.07450981, 1, 1,
0.3734255, -1.106876, 3.796522, 0, 0.07058824, 1, 1,
0.38375, 0.5026392, 0.9189698, 0, 0.0627451, 1, 1,
0.3855862, 0.8828121, -0.2756341, 0, 0.05882353, 1, 1,
0.3860532, 0.8452169, 0.409796, 0, 0.05098039, 1, 1,
0.3876129, -1.604255, 3.30069, 0, 0.04705882, 1, 1,
0.3882109, -0.7608965, 2.901031, 0, 0.03921569, 1, 1,
0.388823, -1.538521, 2.983668, 0, 0.03529412, 1, 1,
0.3910456, -0.6306695, 0.3148683, 0, 0.02745098, 1, 1,
0.3915617, -0.6123973, 2.748168, 0, 0.02352941, 1, 1,
0.3933506, -0.1481505, 0.1998301, 0, 0.01568628, 1, 1,
0.3955066, -0.2660362, 0.5401065, 0, 0.01176471, 1, 1,
0.397745, 0.05660436, 2.345827, 0, 0.003921569, 1, 1,
0.4008444, -0.8980836, 2.889021, 0.003921569, 0, 1, 1,
0.4008774, 0.05773485, 2.014546, 0.007843138, 0, 1, 1,
0.4082292, -0.2987607, 2.118636, 0.01568628, 0, 1, 1,
0.4128174, 0.6346382, -1.422836, 0.01960784, 0, 1, 1,
0.4160147, 0.135852, -1.558923, 0.02745098, 0, 1, 1,
0.4191459, 1.378587, 0.1328974, 0.03137255, 0, 1, 1,
0.4226573, 0.1577694, 0.2812955, 0.03921569, 0, 1, 1,
0.4271313, 0.9146391, 0.3510364, 0.04313726, 0, 1, 1,
0.4271385, -0.005710501, 1.267245, 0.05098039, 0, 1, 1,
0.427949, 1.623168, 0.1009862, 0.05490196, 0, 1, 1,
0.428279, -1.265651, 2.322337, 0.0627451, 0, 1, 1,
0.4309632, -0.3458872, 2.022835, 0.06666667, 0, 1, 1,
0.4316475, -0.2514017, 2.303714, 0.07450981, 0, 1, 1,
0.4323941, 0.5133067, 1.519093, 0.07843138, 0, 1, 1,
0.4342027, 0.1473972, 0.2963733, 0.08627451, 0, 1, 1,
0.4348294, 1.164648, 1.682971, 0.09019608, 0, 1, 1,
0.4371118, -0.04382191, 2.208841, 0.09803922, 0, 1, 1,
0.4411898, -0.09041456, 1.550572, 0.1058824, 0, 1, 1,
0.4458242, -0.7367072, 1.468734, 0.1098039, 0, 1, 1,
0.4482937, 1.002884, -0.4728597, 0.1176471, 0, 1, 1,
0.4496777, 1.287481, -1.995945, 0.1215686, 0, 1, 1,
0.4523155, -0.8017438, 4.106278, 0.1294118, 0, 1, 1,
0.4624877, -0.6007509, 1.551841, 0.1333333, 0, 1, 1,
0.4639821, -0.3264749, -0.02193108, 0.1411765, 0, 1, 1,
0.4664207, 0.1101513, 1.473411, 0.145098, 0, 1, 1,
0.4687155, -0.5808128, 1.575019, 0.1529412, 0, 1, 1,
0.4753341, -0.1605523, 1.293299, 0.1568628, 0, 1, 1,
0.4756362, 0.3660452, 0.7847353, 0.1647059, 0, 1, 1,
0.4761734, 0.3731572, 1.364972, 0.1686275, 0, 1, 1,
0.4777384, -0.261084, -0.163148, 0.1764706, 0, 1, 1,
0.4796363, 0.7091555, -0.2147686, 0.1803922, 0, 1, 1,
0.4861839, -1.300351, 2.876097, 0.1882353, 0, 1, 1,
0.4920238, 1.002145, 0.636366, 0.1921569, 0, 1, 1,
0.5016621, 1.475142, -1.250737, 0.2, 0, 1, 1,
0.5036539, 0.7700554, 0.2397681, 0.2078431, 0, 1, 1,
0.5104247, -0.9739134, 3.29223, 0.2117647, 0, 1, 1,
0.5111043, -0.6220786, 2.529424, 0.2196078, 0, 1, 1,
0.5142034, -1.441555, 0.9652868, 0.2235294, 0, 1, 1,
0.5155193, 0.585364, 0.5941008, 0.2313726, 0, 1, 1,
0.5170701, -1.883981, 2.84182, 0.2352941, 0, 1, 1,
0.5192546, -0.06048534, 0.6762931, 0.2431373, 0, 1, 1,
0.5230097, -1.865223, 3.900948, 0.2470588, 0, 1, 1,
0.5346225, 0.5547947, -0.4023161, 0.254902, 0, 1, 1,
0.5409287, 0.6683844, 1.72391, 0.2588235, 0, 1, 1,
0.5429049, 0.2945926, 2.548656, 0.2666667, 0, 1, 1,
0.5433983, 2.706521, 0.04534198, 0.2705882, 0, 1, 1,
0.5465699, 1.135564, 0.05470812, 0.2784314, 0, 1, 1,
0.5471514, -1.608854, 4.158776, 0.282353, 0, 1, 1,
0.5531932, 1.370042, 0.8685931, 0.2901961, 0, 1, 1,
0.5613721, 1.643814, 1.667245, 0.2941177, 0, 1, 1,
0.5654723, 0.03196592, 0.5677321, 0.3019608, 0, 1, 1,
0.5692372, -2.084282, 2.722039, 0.3098039, 0, 1, 1,
0.5716174, -0.1091443, 3.049025, 0.3137255, 0, 1, 1,
0.573892, -0.8631787, 1.269709, 0.3215686, 0, 1, 1,
0.5741907, 0.4583909, 2.292483, 0.3254902, 0, 1, 1,
0.5762127, 0.6351801, 0.9789664, 0.3333333, 0, 1, 1,
0.5767782, 0.846225, -0.4070881, 0.3372549, 0, 1, 1,
0.5768321, -0.01561635, 2.922716, 0.345098, 0, 1, 1,
0.5784225, 0.05295337, -0.817782, 0.3490196, 0, 1, 1,
0.5792783, 0.124073, 1.675671, 0.3568628, 0, 1, 1,
0.5801668, -1.133881, 1.943662, 0.3607843, 0, 1, 1,
0.581686, -1.384144, 3.864999, 0.3686275, 0, 1, 1,
0.5821216, 1.388299, -0.9965702, 0.372549, 0, 1, 1,
0.5856254, -1.305449, 4.072168, 0.3803922, 0, 1, 1,
0.5934181, -0.2649184, 1.247668, 0.3843137, 0, 1, 1,
0.5952721, -0.9743434, 2.461722, 0.3921569, 0, 1, 1,
0.6013967, -0.5232496, 0.5475346, 0.3960784, 0, 1, 1,
0.6039593, 2.418858, 2.14609, 0.4039216, 0, 1, 1,
0.6068003, -0.9362395, 2.446542, 0.4117647, 0, 1, 1,
0.6073961, -0.4759955, 3.050448, 0.4156863, 0, 1, 1,
0.6117384, -0.2432583, 3.643178, 0.4235294, 0, 1, 1,
0.6139761, 0.5765688, 1.029413, 0.427451, 0, 1, 1,
0.6157275, -0.3718111, 1.329359, 0.4352941, 0, 1, 1,
0.6169751, 0.341574, 1.006747, 0.4392157, 0, 1, 1,
0.6320798, -1.880123, 2.412491, 0.4470588, 0, 1, 1,
0.6334684, -0.5397674, 3.648281, 0.4509804, 0, 1, 1,
0.6349422, -0.7685229, 3.347114, 0.4588235, 0, 1, 1,
0.6364154, 0.7136924, 1.686349, 0.4627451, 0, 1, 1,
0.6451685, -1.114877, 2.299648, 0.4705882, 0, 1, 1,
0.6469348, 0.7579803, 1.68062, 0.4745098, 0, 1, 1,
0.6476126, -0.03904717, 2.20077, 0.4823529, 0, 1, 1,
0.6552389, -1.28506, 2.979268, 0.4862745, 0, 1, 1,
0.660574, -0.5861158, 1.268473, 0.4941176, 0, 1, 1,
0.6611636, -0.330963, 2.254761, 0.5019608, 0, 1, 1,
0.661849, -1.635315, 0.6038284, 0.5058824, 0, 1, 1,
0.6639562, 1.448031, 0.391638, 0.5137255, 0, 1, 1,
0.6641901, -0.5490602, 1.495203, 0.5176471, 0, 1, 1,
0.6675758, -1.389095, 4.653953, 0.5254902, 0, 1, 1,
0.6678973, -1.44366, 2.947644, 0.5294118, 0, 1, 1,
0.6696889, 1.313792, -1.830904, 0.5372549, 0, 1, 1,
0.6697531, -0.05710044, 1.202289, 0.5411765, 0, 1, 1,
0.6739969, 0.7072221, 1.207108, 0.5490196, 0, 1, 1,
0.6767298, -0.609042, 2.581209, 0.5529412, 0, 1, 1,
0.6775772, 0.9114302, 0.5703451, 0.5607843, 0, 1, 1,
0.6900255, 0.8129675, -0.002051326, 0.5647059, 0, 1, 1,
0.6945743, 0.4772269, 2.363347, 0.572549, 0, 1, 1,
0.6971873, -0.7436997, 1.506702, 0.5764706, 0, 1, 1,
0.6972524, 0.7506691, 1.804547, 0.5843138, 0, 1, 1,
0.7003078, -0.7653943, 2.030937, 0.5882353, 0, 1, 1,
0.7005855, 0.624664, 0.8733382, 0.5960785, 0, 1, 1,
0.7056359, 1.005149, -0.289605, 0.6039216, 0, 1, 1,
0.7078435, -0.6673792, 3.071243, 0.6078432, 0, 1, 1,
0.7120082, 2.026577, 0.9009442, 0.6156863, 0, 1, 1,
0.7128944, 0.5338917, -0.6250813, 0.6196079, 0, 1, 1,
0.7151935, -1.211813, 2.891376, 0.627451, 0, 1, 1,
0.7161462, -0.04777249, 3.193132, 0.6313726, 0, 1, 1,
0.7188715, -0.02589376, 1.106935, 0.6392157, 0, 1, 1,
0.7256793, -0.04701585, 2.73044, 0.6431373, 0, 1, 1,
0.7296132, 1.324746, -0.00351344, 0.6509804, 0, 1, 1,
0.7317104, 1.018565, 0.9414623, 0.654902, 0, 1, 1,
0.7321792, -0.432932, 1.970659, 0.6627451, 0, 1, 1,
0.7325234, -0.5379539, 2.341895, 0.6666667, 0, 1, 1,
0.7349159, 0.8792235, 0.6429312, 0.6745098, 0, 1, 1,
0.7362686, 0.3159947, 3.658844, 0.6784314, 0, 1, 1,
0.7400912, -0.4729272, 1.348932, 0.6862745, 0, 1, 1,
0.7423877, 0.4671054, 1.556247, 0.6901961, 0, 1, 1,
0.7428799, -0.5339402, 2.02562, 0.6980392, 0, 1, 1,
0.7468407, 0.3897721, 1.328947, 0.7058824, 0, 1, 1,
0.7480575, -0.5812262, 2.238473, 0.7098039, 0, 1, 1,
0.75255, -0.5979877, 2.854623, 0.7176471, 0, 1, 1,
0.7546, 0.6693857, 0.3897318, 0.7215686, 0, 1, 1,
0.7622395, -0.73277, 1.873938, 0.7294118, 0, 1, 1,
0.7628843, -0.0857109, 2.204116, 0.7333333, 0, 1, 1,
0.7768177, 0.6181305, 0.6795625, 0.7411765, 0, 1, 1,
0.7773303, 1.023457, 0.1105929, 0.7450981, 0, 1, 1,
0.7803051, -0.5148298, 2.274373, 0.7529412, 0, 1, 1,
0.7808896, -1.476161, 4.597693, 0.7568628, 0, 1, 1,
0.7837521, 0.2985036, 1.058312, 0.7647059, 0, 1, 1,
0.7857121, 0.8758013, -0.3495017, 0.7686275, 0, 1, 1,
0.78847, 0.4602395, 2.105869, 0.7764706, 0, 1, 1,
0.7970401, 0.693846, 1.141844, 0.7803922, 0, 1, 1,
0.8006222, 2.040435, -1.861443, 0.7882353, 0, 1, 1,
0.8222594, 1.49588, 1.747947, 0.7921569, 0, 1, 1,
0.8242985, -1.657126, 1.324303, 0.8, 0, 1, 1,
0.8340536, -0.267648, 1.486341, 0.8078431, 0, 1, 1,
0.8383213, -0.6263644, 1.586179, 0.8117647, 0, 1, 1,
0.8431935, 0.8370348, 1.135979, 0.8196079, 0, 1, 1,
0.843424, -1.788589, 3.440065, 0.8235294, 0, 1, 1,
0.8494885, -0.8018387, 3.822973, 0.8313726, 0, 1, 1,
0.8503491, -0.6931137, 2.239662, 0.8352941, 0, 1, 1,
0.8547016, 0.329424, 0.2399788, 0.8431373, 0, 1, 1,
0.8565619, -0.2810719, 3.077507, 0.8470588, 0, 1, 1,
0.8569605, 0.04853033, 1.600831, 0.854902, 0, 1, 1,
0.8580992, -1.269319, 1.698673, 0.8588235, 0, 1, 1,
0.8629141, 1.468204, 0.9996181, 0.8666667, 0, 1, 1,
0.8651127, -2.975942, 3.47, 0.8705882, 0, 1, 1,
0.866846, 0.5955771, 1.357343, 0.8784314, 0, 1, 1,
0.8689274, -1.670365, 1.569483, 0.8823529, 0, 1, 1,
0.8690166, -0.1269813, 0.7966125, 0.8901961, 0, 1, 1,
0.8717599, -1.713232, 3.566195, 0.8941177, 0, 1, 1,
0.8771527, 0.2678668, 1.628782, 0.9019608, 0, 1, 1,
0.8787451, -2.124776, 2.773927, 0.9098039, 0, 1, 1,
0.8858162, 0.0058865, 2.783651, 0.9137255, 0, 1, 1,
0.8860502, 0.7676094, -0.817733, 0.9215686, 0, 1, 1,
0.8926708, -1.052983, 2.24098, 0.9254902, 0, 1, 1,
0.8951845, -0.04481483, 2.417812, 0.9333333, 0, 1, 1,
0.8974387, -0.3881741, -0.6316887, 0.9372549, 0, 1, 1,
0.8977964, 0.5839351, 1.587501, 0.945098, 0, 1, 1,
0.898017, 0.2539629, 1.519546, 0.9490196, 0, 1, 1,
0.9030085, -0.7458891, 0.2056493, 0.9568627, 0, 1, 1,
0.9072185, -1.747093, 2.627075, 0.9607843, 0, 1, 1,
0.9086493, -0.740728, 1.913034, 0.9686275, 0, 1, 1,
0.9126449, -0.2724136, 2.363096, 0.972549, 0, 1, 1,
0.9184831, -0.4265168, 2.430484, 0.9803922, 0, 1, 1,
0.9218616, -0.08380309, 0.1497096, 0.9843137, 0, 1, 1,
0.9316054, -0.04189319, 1.787863, 0.9921569, 0, 1, 1,
0.9352194, -0.2558739, 1.072896, 0.9960784, 0, 1, 1,
0.9373852, 0.2537347, 0.9321207, 1, 0, 0.9960784, 1,
0.9379268, -1.109682, 0.7749068, 1, 0, 0.9882353, 1,
0.9404693, -1.417239, 3.26874, 1, 0, 0.9843137, 1,
0.9466352, 1.731745, 0.1744315, 1, 0, 0.9764706, 1,
0.9634283, 0.4535131, 2.637673, 1, 0, 0.972549, 1,
0.9648595, -0.2523716, 3.542382, 1, 0, 0.9647059, 1,
0.96527, 0.007266446, 1.318104, 1, 0, 0.9607843, 1,
0.9674573, -0.2065639, 0.5951155, 1, 0, 0.9529412, 1,
0.9740494, 0.2927494, 0.8777451, 1, 0, 0.9490196, 1,
0.97453, -1.348136, 2.322646, 1, 0, 0.9411765, 1,
0.9777319, 0.3205571, 1.420441, 1, 0, 0.9372549, 1,
0.9781966, -0.6743525, 1.972363, 1, 0, 0.9294118, 1,
0.9855471, -1.438972, 3.839118, 1, 0, 0.9254902, 1,
0.987239, 0.4743499, 0.2770696, 1, 0, 0.9176471, 1,
0.9875373, 0.6640546, 2.250648, 1, 0, 0.9137255, 1,
0.9900118, -0.003560585, 0.08253908, 1, 0, 0.9058824, 1,
1.003973, 0.2982613, 0.1575355, 1, 0, 0.9019608, 1,
1.011326, -1.391895, 1.019302, 1, 0, 0.8941177, 1,
1.013626, -0.2022911, 2.141607, 1, 0, 0.8862745, 1,
1.024513, 0.9421386, 0.3491058, 1, 0, 0.8823529, 1,
1.031783, 0.5234644, 1.186219, 1, 0, 0.8745098, 1,
1.032709, -0.6158544, 2.465979, 1, 0, 0.8705882, 1,
1.03656, -0.1434036, 1.299636, 1, 0, 0.8627451, 1,
1.042555, 1.391906, 0.420983, 1, 0, 0.8588235, 1,
1.044238, -0.6594619, 1.955336, 1, 0, 0.8509804, 1,
1.059635, 0.6147356, 1.809374, 1, 0, 0.8470588, 1,
1.065781, 1.428392, 1.630666, 1, 0, 0.8392157, 1,
1.071875, 0.9107289, 1.837096, 1, 0, 0.8352941, 1,
1.076736, -1.434883, -0.0594858, 1, 0, 0.827451, 1,
1.084704, 1.142709, 1.028266, 1, 0, 0.8235294, 1,
1.086296, 0.5487987, 0.6521688, 1, 0, 0.8156863, 1,
1.090978, -0.3988999, 2.913817, 1, 0, 0.8117647, 1,
1.098355, -0.3587023, 2.147248, 1, 0, 0.8039216, 1,
1.100158, 0.9878865, -0.43755, 1, 0, 0.7960784, 1,
1.101975, 0.4471124, 1.33548, 1, 0, 0.7921569, 1,
1.104212, 0.8119654, 0.4530624, 1, 0, 0.7843137, 1,
1.116957, -0.9210535, 2.173833, 1, 0, 0.7803922, 1,
1.122813, -0.2834348, 0.6917971, 1, 0, 0.772549, 1,
1.126921, -0.9030272, 2.280354, 1, 0, 0.7686275, 1,
1.155257, 0.3176615, 1.069171, 1, 0, 0.7607843, 1,
1.156829, -0.8654814, 1.925819, 1, 0, 0.7568628, 1,
1.166327, 2.251095, 1.185862, 1, 0, 0.7490196, 1,
1.174565, 0.02508269, 1.288568, 1, 0, 0.7450981, 1,
1.1871, 0.3382181, 1.311863, 1, 0, 0.7372549, 1,
1.191669, 0.1708134, 2.128812, 1, 0, 0.7333333, 1,
1.197661, 0.3105692, 1.718063, 1, 0, 0.7254902, 1,
1.203012, -1.229566, 3.105475, 1, 0, 0.7215686, 1,
1.206682, -0.3276265, 2.263963, 1, 0, 0.7137255, 1,
1.208753, 0.1593125, 1.436474, 1, 0, 0.7098039, 1,
1.218789, -1.1318, 2.703532, 1, 0, 0.7019608, 1,
1.23145, -1.417135, 3.358607, 1, 0, 0.6941177, 1,
1.242696, 1.042295, 0.5033852, 1, 0, 0.6901961, 1,
1.254673, 0.6641735, -0.8339534, 1, 0, 0.682353, 1,
1.258389, 2.095458, 2.137562, 1, 0, 0.6784314, 1,
1.258417, 0.954729, 1.560263, 1, 0, 0.6705883, 1,
1.259422, -0.2374277, -0.4793392, 1, 0, 0.6666667, 1,
1.262333, -1.365842, 2.194698, 1, 0, 0.6588235, 1,
1.26403, -1.490074, 2.217899, 1, 0, 0.654902, 1,
1.266937, -1.019001, 2.152449, 1, 0, 0.6470588, 1,
1.268494, 0.1045385, 3.165952, 1, 0, 0.6431373, 1,
1.279132, -0.5266789, 2.181611, 1, 0, 0.6352941, 1,
1.2902, 0.1635568, 0.8350862, 1, 0, 0.6313726, 1,
1.304937, 0.3976892, 2.535997, 1, 0, 0.6235294, 1,
1.316231, -0.1024386, 1.304348, 1, 0, 0.6196079, 1,
1.329194, -1.912889, 3.800851, 1, 0, 0.6117647, 1,
1.331956, 1.432545, 0.8484377, 1, 0, 0.6078432, 1,
1.342046, 0.9029271, 0.8644463, 1, 0, 0.6, 1,
1.34747, -0.412783, 1.995824, 1, 0, 0.5921569, 1,
1.352814, 0.5502561, 0.5442536, 1, 0, 0.5882353, 1,
1.359098, 1.592929, -0.06980003, 1, 0, 0.5803922, 1,
1.371525, -0.531687, 2.51487, 1, 0, 0.5764706, 1,
1.374344, -0.7386788, 4.277561, 1, 0, 0.5686275, 1,
1.374949, -0.3397056, 1.821852, 1, 0, 0.5647059, 1,
1.382662, -1.362847, 1.756333, 1, 0, 0.5568628, 1,
1.388681, -1.194754, 1.640414, 1, 0, 0.5529412, 1,
1.397998, -0.08689812, 0.8732952, 1, 0, 0.5450981, 1,
1.40196, -1.182046, 1.147864, 1, 0, 0.5411765, 1,
1.404612, 0.06154032, 1.24267, 1, 0, 0.5333334, 1,
1.434468, -0.485423, 2.773932, 1, 0, 0.5294118, 1,
1.450799, -1.061436, 2.239379, 1, 0, 0.5215687, 1,
1.457693, 0.190749, 2.320211, 1, 0, 0.5176471, 1,
1.458752, -1.443991, 1.665641, 1, 0, 0.509804, 1,
1.473857, 2.041194, 0.9557254, 1, 0, 0.5058824, 1,
1.48712, -0.0005716111, 1.103788, 1, 0, 0.4980392, 1,
1.494158, -1.140509, 1.209787, 1, 0, 0.4901961, 1,
1.49745, -1.052883, 2.015801, 1, 0, 0.4862745, 1,
1.498173, -0.3245598, 1.278937, 1, 0, 0.4784314, 1,
1.506781, 0.2188242, 1.694381, 1, 0, 0.4745098, 1,
1.523499, 1.092625, 2.030662, 1, 0, 0.4666667, 1,
1.529556, 0.5922733, -1.250417, 1, 0, 0.4627451, 1,
1.5298, -2.339041, 1.679599, 1, 0, 0.454902, 1,
1.533447, -1.775949, 1.618403, 1, 0, 0.4509804, 1,
1.534931, -0.2598749, 2.921837, 1, 0, 0.4431373, 1,
1.540282, 1.267222, 0.4947589, 1, 0, 0.4392157, 1,
1.550792, -0.2487084, 2.38779, 1, 0, 0.4313726, 1,
1.553757, 1.209385, -0.5130605, 1, 0, 0.427451, 1,
1.558378, 0.3149517, 0.236698, 1, 0, 0.4196078, 1,
1.566188, 0.8787614, 2.005685, 1, 0, 0.4156863, 1,
1.568633, 1.424367, 0.3870609, 1, 0, 0.4078431, 1,
1.569095, -0.5536559, 1.34163, 1, 0, 0.4039216, 1,
1.573542, -0.5773271, 2.905677, 1, 0, 0.3960784, 1,
1.582751, -0.9859502, 3.096912, 1, 0, 0.3882353, 1,
1.586974, 1.8487, -0.3902822, 1, 0, 0.3843137, 1,
1.587641, -0.5379022, 2.98824, 1, 0, 0.3764706, 1,
1.592664, 0.5096535, 0.8649908, 1, 0, 0.372549, 1,
1.62743, 0.04572889, 0.1565058, 1, 0, 0.3647059, 1,
1.644154, 1.283399, 0.2280184, 1, 0, 0.3607843, 1,
1.656955, -0.008571764, 2.008968, 1, 0, 0.3529412, 1,
1.676023, -0.1405484, 1.202901, 1, 0, 0.3490196, 1,
1.687435, -0.3850995, 1.452676, 1, 0, 0.3411765, 1,
1.695359, 0.5106946, 2.53005, 1, 0, 0.3372549, 1,
1.697385, -0.02314884, 1.998075, 1, 0, 0.3294118, 1,
1.722005, -1.484055, 2.920031, 1, 0, 0.3254902, 1,
1.722302, -1.047408, 2.035339, 1, 0, 0.3176471, 1,
1.724173, 0.8710655, 1.612404, 1, 0, 0.3137255, 1,
1.72669, 0.8862811, 1.01593, 1, 0, 0.3058824, 1,
1.742154, -0.7357464, 1.841157, 1, 0, 0.2980392, 1,
1.746678, -1.688561, 0.3477517, 1, 0, 0.2941177, 1,
1.750855, -0.2584882, 1.363756, 1, 0, 0.2862745, 1,
1.758597, -1.687131, 1.775946, 1, 0, 0.282353, 1,
1.774506, 1.314073, 0.4082635, 1, 0, 0.2745098, 1,
1.822363, 0.5693908, -0.1238627, 1, 0, 0.2705882, 1,
1.837751, 0.8734294, 2.182132, 1, 0, 0.2627451, 1,
1.846902, 1.162041, 0.350031, 1, 0, 0.2588235, 1,
1.870106, 0.1502589, 2.190035, 1, 0, 0.2509804, 1,
1.887299, -0.6454438, 1.937924, 1, 0, 0.2470588, 1,
1.889727, 0.7222477, 2.518985, 1, 0, 0.2392157, 1,
1.905452, -0.7136016, 3.339557, 1, 0, 0.2352941, 1,
1.907408, -0.818943, 1.775139, 1, 0, 0.227451, 1,
1.909675, -0.6164144, 3.225516, 1, 0, 0.2235294, 1,
1.918017, -1.191671, 2.668978, 1, 0, 0.2156863, 1,
1.934033, -0.1705118, 0.6175513, 1, 0, 0.2117647, 1,
1.944643, -0.5343005, -0.9909011, 1, 0, 0.2039216, 1,
1.990816, 1.581732, 0.2361175, 1, 0, 0.1960784, 1,
1.999023, 1.484393, -0.09630977, 1, 0, 0.1921569, 1,
2.014413, -1.841576, 0.9467314, 1, 0, 0.1843137, 1,
2.024797, -1.164726, 2.823636, 1, 0, 0.1803922, 1,
2.040164, -1.055775, 0.7292407, 1, 0, 0.172549, 1,
2.051713, 2.240381, 1.421595, 1, 0, 0.1686275, 1,
2.060522, -0.5142883, 0.4710923, 1, 0, 0.1607843, 1,
2.06857, -0.09330991, 1.239727, 1, 0, 0.1568628, 1,
2.079152, 0.8528742, 2.728946, 1, 0, 0.1490196, 1,
2.137889, -0.06259191, 2.671286, 1, 0, 0.145098, 1,
2.146019, -0.1749652, 3.18916, 1, 0, 0.1372549, 1,
2.243295, -0.1257017, 2.798024, 1, 0, 0.1333333, 1,
2.251594, -0.3168361, 1.376098, 1, 0, 0.1254902, 1,
2.253951, 0.6640025, 1.571712, 1, 0, 0.1215686, 1,
2.269514, -0.2867311, 1.245636, 1, 0, 0.1137255, 1,
2.301814, -0.515893, 1.796768, 1, 0, 0.1098039, 1,
2.310115, -0.8843792, 1.695863, 1, 0, 0.1019608, 1,
2.336559, -0.5032099, 1.887684, 1, 0, 0.09411765, 1,
2.363896, -1.105962, 0.2073934, 1, 0, 0.09019608, 1,
2.411781, 0.2827404, 2.185961, 1, 0, 0.08235294, 1,
2.509692, 0.1974857, 1.215886, 1, 0, 0.07843138, 1,
2.55836, 0.4073558, 0.9103073, 1, 0, 0.07058824, 1,
2.610124, -1.319189, 2.867172, 1, 0, 0.06666667, 1,
2.618134, 1.088396, 1.975579, 1, 0, 0.05882353, 1,
2.635578, 1.648566, 1.069634, 1, 0, 0.05490196, 1,
2.656772, -3.040258, 2.509615, 1, 0, 0.04705882, 1,
2.659653, -1.07693, 1.570202, 1, 0, 0.04313726, 1,
2.678125, -0.8045799, 1.837044, 1, 0, 0.03529412, 1,
2.848167, -0.3652939, 1.963728, 1, 0, 0.03137255, 1,
3.037689, 0.4703636, 0.8178971, 1, 0, 0.02352941, 1,
3.050558, 2.545695, 1.270869, 1, 0, 0.01960784, 1,
3.348536, -0.2412555, 2.535592, 1, 0, 0.01176471, 1,
3.363952, -0.7813039, 0.8568875, 1, 0, 0.007843138, 1
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
0.03218782, -4.090903, -7.159149, 0, -0.5, 0.5, 0.5,
0.03218782, -4.090903, -7.159149, 1, -0.5, 0.5, 0.5,
0.03218782, -4.090903, -7.159149, 1, 1.5, 0.5, 0.5,
0.03218782, -4.090903, -7.159149, 0, 1.5, 0.5, 0.5
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
-4.429045, -0.04632115, -7.159149, 0, -0.5, 0.5, 0.5,
-4.429045, -0.04632115, -7.159149, 1, -0.5, 0.5, 0.5,
-4.429045, -0.04632115, -7.159149, 1, 1.5, 0.5, 0.5,
-4.429045, -0.04632115, -7.159149, 0, 1.5, 0.5, 0.5
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
-4.429045, -4.090903, 0.5212839, 0, -0.5, 0.5, 0.5,
-4.429045, -4.090903, 0.5212839, 1, -0.5, 0.5, 0.5,
-4.429045, -4.090903, 0.5212839, 1, 1.5, 0.5, 0.5,
-4.429045, -4.090903, 0.5212839, 0, 1.5, 0.5, 0.5
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
-3, -3.157538, -5.386742,
3, -3.157538, -5.386742,
-3, -3.157538, -5.386742,
-3, -3.313099, -5.682143,
-2, -3.157538, -5.386742,
-2, -3.313099, -5.682143,
-1, -3.157538, -5.386742,
-1, -3.313099, -5.682143,
0, -3.157538, -5.386742,
0, -3.313099, -5.682143,
1, -3.157538, -5.386742,
1, -3.313099, -5.682143,
2, -3.157538, -5.386742,
2, -3.313099, -5.682143,
3, -3.157538, -5.386742,
3, -3.313099, -5.682143
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
-3, -3.624221, -6.272945, 0, -0.5, 0.5, 0.5,
-3, -3.624221, -6.272945, 1, -0.5, 0.5, 0.5,
-3, -3.624221, -6.272945, 1, 1.5, 0.5, 0.5,
-3, -3.624221, -6.272945, 0, 1.5, 0.5, 0.5,
-2, -3.624221, -6.272945, 0, -0.5, 0.5, 0.5,
-2, -3.624221, -6.272945, 1, -0.5, 0.5, 0.5,
-2, -3.624221, -6.272945, 1, 1.5, 0.5, 0.5,
-2, -3.624221, -6.272945, 0, 1.5, 0.5, 0.5,
-1, -3.624221, -6.272945, 0, -0.5, 0.5, 0.5,
-1, -3.624221, -6.272945, 1, -0.5, 0.5, 0.5,
-1, -3.624221, -6.272945, 1, 1.5, 0.5, 0.5,
-1, -3.624221, -6.272945, 0, 1.5, 0.5, 0.5,
0, -3.624221, -6.272945, 0, -0.5, 0.5, 0.5,
0, -3.624221, -6.272945, 1, -0.5, 0.5, 0.5,
0, -3.624221, -6.272945, 1, 1.5, 0.5, 0.5,
0, -3.624221, -6.272945, 0, 1.5, 0.5, 0.5,
1, -3.624221, -6.272945, 0, -0.5, 0.5, 0.5,
1, -3.624221, -6.272945, 1, -0.5, 0.5, 0.5,
1, -3.624221, -6.272945, 1, 1.5, 0.5, 0.5,
1, -3.624221, -6.272945, 0, 1.5, 0.5, 0.5,
2, -3.624221, -6.272945, 0, -0.5, 0.5, 0.5,
2, -3.624221, -6.272945, 1, -0.5, 0.5, 0.5,
2, -3.624221, -6.272945, 1, 1.5, 0.5, 0.5,
2, -3.624221, -6.272945, 0, 1.5, 0.5, 0.5,
3, -3.624221, -6.272945, 0, -0.5, 0.5, 0.5,
3, -3.624221, -6.272945, 1, -0.5, 0.5, 0.5,
3, -3.624221, -6.272945, 1, 1.5, 0.5, 0.5,
3, -3.624221, -6.272945, 0, 1.5, 0.5, 0.5
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
-3.399529, -3, -5.386742,
-3.399529, 2, -5.386742,
-3.399529, -3, -5.386742,
-3.571115, -3, -5.682143,
-3.399529, -2, -5.386742,
-3.571115, -2, -5.682143,
-3.399529, -1, -5.386742,
-3.571115, -1, -5.682143,
-3.399529, 0, -5.386742,
-3.571115, 0, -5.682143,
-3.399529, 1, -5.386742,
-3.571115, 1, -5.682143,
-3.399529, 2, -5.386742,
-3.571115, 2, -5.682143
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
-3.914287, -3, -6.272945, 0, -0.5, 0.5, 0.5,
-3.914287, -3, -6.272945, 1, -0.5, 0.5, 0.5,
-3.914287, -3, -6.272945, 1, 1.5, 0.5, 0.5,
-3.914287, -3, -6.272945, 0, 1.5, 0.5, 0.5,
-3.914287, -2, -6.272945, 0, -0.5, 0.5, 0.5,
-3.914287, -2, -6.272945, 1, -0.5, 0.5, 0.5,
-3.914287, -2, -6.272945, 1, 1.5, 0.5, 0.5,
-3.914287, -2, -6.272945, 0, 1.5, 0.5, 0.5,
-3.914287, -1, -6.272945, 0, -0.5, 0.5, 0.5,
-3.914287, -1, -6.272945, 1, -0.5, 0.5, 0.5,
-3.914287, -1, -6.272945, 1, 1.5, 0.5, 0.5,
-3.914287, -1, -6.272945, 0, 1.5, 0.5, 0.5,
-3.914287, 0, -6.272945, 0, -0.5, 0.5, 0.5,
-3.914287, 0, -6.272945, 1, -0.5, 0.5, 0.5,
-3.914287, 0, -6.272945, 1, 1.5, 0.5, 0.5,
-3.914287, 0, -6.272945, 0, 1.5, 0.5, 0.5,
-3.914287, 1, -6.272945, 0, -0.5, 0.5, 0.5,
-3.914287, 1, -6.272945, 1, -0.5, 0.5, 0.5,
-3.914287, 1, -6.272945, 1, 1.5, 0.5, 0.5,
-3.914287, 1, -6.272945, 0, 1.5, 0.5, 0.5,
-3.914287, 2, -6.272945, 0, -0.5, 0.5, 0.5,
-3.914287, 2, -6.272945, 1, -0.5, 0.5, 0.5,
-3.914287, 2, -6.272945, 1, 1.5, 0.5, 0.5,
-3.914287, 2, -6.272945, 0, 1.5, 0.5, 0.5
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
-3.399529, -3.157538, -4,
-3.399529, -3.157538, 6,
-3.399529, -3.157538, -4,
-3.571115, -3.313099, -4,
-3.399529, -3.157538, -2,
-3.571115, -3.313099, -2,
-3.399529, -3.157538, 0,
-3.571115, -3.313099, 0,
-3.399529, -3.157538, 2,
-3.571115, -3.313099, 2,
-3.399529, -3.157538, 4,
-3.571115, -3.313099, 4,
-3.399529, -3.157538, 6,
-3.571115, -3.313099, 6
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
"4",
"6"
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
-3.914287, -3.624221, -4, 0, -0.5, 0.5, 0.5,
-3.914287, -3.624221, -4, 1, -0.5, 0.5, 0.5,
-3.914287, -3.624221, -4, 1, 1.5, 0.5, 0.5,
-3.914287, -3.624221, -4, 0, 1.5, 0.5, 0.5,
-3.914287, -3.624221, -2, 0, -0.5, 0.5, 0.5,
-3.914287, -3.624221, -2, 1, -0.5, 0.5, 0.5,
-3.914287, -3.624221, -2, 1, 1.5, 0.5, 0.5,
-3.914287, -3.624221, -2, 0, 1.5, 0.5, 0.5,
-3.914287, -3.624221, 0, 0, -0.5, 0.5, 0.5,
-3.914287, -3.624221, 0, 1, -0.5, 0.5, 0.5,
-3.914287, -3.624221, 0, 1, 1.5, 0.5, 0.5,
-3.914287, -3.624221, 0, 0, 1.5, 0.5, 0.5,
-3.914287, -3.624221, 2, 0, -0.5, 0.5, 0.5,
-3.914287, -3.624221, 2, 1, -0.5, 0.5, 0.5,
-3.914287, -3.624221, 2, 1, 1.5, 0.5, 0.5,
-3.914287, -3.624221, 2, 0, 1.5, 0.5, 0.5,
-3.914287, -3.624221, 4, 0, -0.5, 0.5, 0.5,
-3.914287, -3.624221, 4, 1, -0.5, 0.5, 0.5,
-3.914287, -3.624221, 4, 1, 1.5, 0.5, 0.5,
-3.914287, -3.624221, 4, 0, 1.5, 0.5, 0.5,
-3.914287, -3.624221, 6, 0, -0.5, 0.5, 0.5,
-3.914287, -3.624221, 6, 1, -0.5, 0.5, 0.5,
-3.914287, -3.624221, 6, 1, 1.5, 0.5, 0.5,
-3.914287, -3.624221, 6, 0, 1.5, 0.5, 0.5
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
-3.399529, -3.157538, -5.386742,
-3.399529, 3.064896, -5.386742,
-3.399529, -3.157538, 6.429309,
-3.399529, 3.064896, 6.429309,
-3.399529, -3.157538, -5.386742,
-3.399529, -3.157538, 6.429309,
-3.399529, 3.064896, -5.386742,
-3.399529, 3.064896, 6.429309,
-3.399529, -3.157538, -5.386742,
3.463905, -3.157538, -5.386742,
-3.399529, -3.157538, 6.429309,
3.463905, -3.157538, 6.429309,
-3.399529, 3.064896, -5.386742,
3.463905, 3.064896, -5.386742,
-3.399529, 3.064896, 6.429309,
3.463905, 3.064896, 6.429309,
3.463905, -3.157538, -5.386742,
3.463905, 3.064896, -5.386742,
3.463905, -3.157538, 6.429309,
3.463905, 3.064896, 6.429309,
3.463905, -3.157538, -5.386742,
3.463905, -3.157538, 6.429309,
3.463905, 3.064896, -5.386742,
3.463905, 3.064896, 6.429309
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
var radius = 8.017616;
var distance = 35.67128;
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
mvMatrix.translate( -0.03218782, 0.04632115, -0.5212839 );
mvMatrix.scale( 1.263042, 1.393153, 0.7336465 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67128);
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
trietazine<-read.table("trietazine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trietazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'trietazine' not found
```

```r
y<-trietazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'trietazine' not found
```

```r
z<-trietazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'trietazine' not found
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
-3.299577, 0.7452531, -2.489022, 0, 0, 1, 1, 1,
-3.188649, 0.7642751, -1.398287, 1, 0, 0, 1, 1,
-2.886995, -0.5707409, -0.886053, 1, 0, 0, 1, 1,
-2.490687, 0.9698525, -2.397682, 1, 0, 0, 1, 1,
-2.473335, -1.054962, -1.662409, 1, 0, 0, 1, 1,
-2.452332, 1.331118, -2.076167, 1, 0, 0, 1, 1,
-2.433062, 0.6369369, -2.137367, 0, 0, 0, 1, 1,
-2.351878, 1.062721, -1.137126, 0, 0, 0, 1, 1,
-2.310512, 0.9621335, -1.702022, 0, 0, 0, 1, 1,
-2.288983, 0.8351712, -0.7070413, 0, 0, 0, 1, 1,
-2.269572, -0.586764, -2.845191, 0, 0, 0, 1, 1,
-2.267743, -0.2128887, -0.3951539, 0, 0, 0, 1, 1,
-2.261424, -0.1984108, -0.9216539, 0, 0, 0, 1, 1,
-2.22855, -0.06446739, -3.307914, 1, 1, 1, 1, 1,
-2.161887, 1.596366, -1.570474, 1, 1, 1, 1, 1,
-2.146333, -1.481982, -1.909297, 1, 1, 1, 1, 1,
-2.135591, 0.1383134, -1.560554, 1, 1, 1, 1, 1,
-2.09467, -1.421751, 0.2609468, 1, 1, 1, 1, 1,
-2.091354, 0.2147307, 0.9470527, 1, 1, 1, 1, 1,
-2.078373, 1.168737, 0.3270057, 1, 1, 1, 1, 1,
-2.073291, 1.315512, -2.214277, 1, 1, 1, 1, 1,
-2.068159, 0.4883105, -0.8338037, 1, 1, 1, 1, 1,
-1.993889, -0.002980406, -2.630418, 1, 1, 1, 1, 1,
-1.972267, -0.3224036, -2.80072, 1, 1, 1, 1, 1,
-1.958197, 0.2201174, -2.749298, 1, 1, 1, 1, 1,
-1.935952, -0.1647306, -1.530113, 1, 1, 1, 1, 1,
-1.93374, -0.2284168, -4.203649, 1, 1, 1, 1, 1,
-1.930701, 0.8702601, -0.5685604, 1, 1, 1, 1, 1,
-1.914039, 0.3657646, -1.783852, 0, 0, 1, 1, 1,
-1.912162, -0.8728352, -2.342248, 1, 0, 0, 1, 1,
-1.890733, 0.737958, -0.7759523, 1, 0, 0, 1, 1,
-1.890293, 0.9905046, -0.2247106, 1, 0, 0, 1, 1,
-1.858468, 1.051344, -1.975395, 1, 0, 0, 1, 1,
-1.830649, 0.5923066, -2.075214, 1, 0, 0, 1, 1,
-1.823013, 1.060353, -1.963991, 0, 0, 0, 1, 1,
-1.783144, 0.03089275, -0.906526, 0, 0, 0, 1, 1,
-1.778262, -0.2670753, -2.301023, 0, 0, 0, 1, 1,
-1.757967, 0.06139105, -1.696598, 0, 0, 0, 1, 1,
-1.749227, -0.4131225, -1.539296, 0, 0, 0, 1, 1,
-1.702809, -0.1578135, -1.55778, 0, 0, 0, 1, 1,
-1.694091, 0.7769948, -0.6066227, 0, 0, 0, 1, 1,
-1.676214, -0.2966658, -1.509872, 1, 1, 1, 1, 1,
-1.661578, 0.3590169, 0.2793502, 1, 1, 1, 1, 1,
-1.657805, -1.219532, -1.3661, 1, 1, 1, 1, 1,
-1.656101, -0.3828656, -1.172912, 1, 1, 1, 1, 1,
-1.647191, 2.102717, -0.7076795, 1, 1, 1, 1, 1,
-1.59683, -0.07315209, -1.992637, 1, 1, 1, 1, 1,
-1.571346, -0.01489107, -2.462053, 1, 1, 1, 1, 1,
-1.565887, 0.8015804, -1.478373, 1, 1, 1, 1, 1,
-1.558797, 0.5758762, -2.536407, 1, 1, 1, 1, 1,
-1.540411, -2.352013, -2.335721, 1, 1, 1, 1, 1,
-1.533301, 0.4255604, -3.316226, 1, 1, 1, 1, 1,
-1.531112, -2.301393, -2.285511, 1, 1, 1, 1, 1,
-1.50896, -0.4283444, -1.235591, 1, 1, 1, 1, 1,
-1.487332, 0.4189948, -0.5125704, 1, 1, 1, 1, 1,
-1.474768, 2.587655, -0.5784236, 1, 1, 1, 1, 1,
-1.472921, 1.254884, 0.1635736, 0, 0, 1, 1, 1,
-1.461065, -1.552023, -3.525263, 1, 0, 0, 1, 1,
-1.459525, 0.8255594, 0.5857604, 1, 0, 0, 1, 1,
-1.434001, -0.3729211, -2.465705, 1, 0, 0, 1, 1,
-1.426067, -1.398184, -2.602932, 1, 0, 0, 1, 1,
-1.422968, -0.9093388, -1.764664, 1, 0, 0, 1, 1,
-1.416529, -0.460232, -0.6522092, 0, 0, 0, 1, 1,
-1.407109, 0.6481273, -0.8068429, 0, 0, 0, 1, 1,
-1.40585, 1.039475, -1.870987, 0, 0, 0, 1, 1,
-1.402603, -0.4469618, -2.845164, 0, 0, 0, 1, 1,
-1.396122, -0.4109826, -2.243272, 0, 0, 0, 1, 1,
-1.395587, -1.560066, -2.790869, 0, 0, 0, 1, 1,
-1.382654, 0.5643059, -3.256875, 0, 0, 0, 1, 1,
-1.373884, -0.6378151, -2.825324, 1, 1, 1, 1, 1,
-1.369258, 0.4067142, -2.081105, 1, 1, 1, 1, 1,
-1.36619, 0.7904425, 0.381678, 1, 1, 1, 1, 1,
-1.363769, 0.1007785, -1.096666, 1, 1, 1, 1, 1,
-1.360852, 0.02147659, -0.7300411, 1, 1, 1, 1, 1,
-1.357877, 0.2137675, -1.631976, 1, 1, 1, 1, 1,
-1.355757, -0.6527444, -2.507376, 1, 1, 1, 1, 1,
-1.347096, 0.5325591, -1.478106, 1, 1, 1, 1, 1,
-1.34619, 0.1082246, -3.031978, 1, 1, 1, 1, 1,
-1.336368, -0.7976509, -2.827204, 1, 1, 1, 1, 1,
-1.324507, -1.045138, -0.03766954, 1, 1, 1, 1, 1,
-1.318604, 1.319849, 0.194903, 1, 1, 1, 1, 1,
-1.313807, 0.5233909, -1.403667, 1, 1, 1, 1, 1,
-1.313626, 1.912049, -0.4601318, 1, 1, 1, 1, 1,
-1.312011, 0.2354133, -0.4571309, 1, 1, 1, 1, 1,
-1.306661, 0.393584, -0.9705102, 0, 0, 1, 1, 1,
-1.293992, 0.3476719, -1.544235, 1, 0, 0, 1, 1,
-1.290172, 1.209637, -1.8983, 1, 0, 0, 1, 1,
-1.288269, -2.753027, -2.429132, 1, 0, 0, 1, 1,
-1.275403, 0.3186196, -1.659206, 1, 0, 0, 1, 1,
-1.273986, 1.607975, -0.7964215, 1, 0, 0, 1, 1,
-1.268684, 1.073224, -1.150845, 0, 0, 0, 1, 1,
-1.266505, -1.432502, -3.053433, 0, 0, 0, 1, 1,
-1.266402, -0.716381, -1.904125, 0, 0, 0, 1, 1,
-1.265128, -1.137734, -2.155745, 0, 0, 0, 1, 1,
-1.263373, -0.06886939, -2.820589, 0, 0, 0, 1, 1,
-1.258095, 0.681258, -0.8978935, 0, 0, 0, 1, 1,
-1.257931, 1.599209, -1.083561, 0, 0, 0, 1, 1,
-1.254628, -1.790565, -3.59731, 1, 1, 1, 1, 1,
-1.254258, 1.041286, -1.129855, 1, 1, 1, 1, 1,
-1.252472, 1.095499, -0.2831718, 1, 1, 1, 1, 1,
-1.242842, -0.5882069, -1.665195, 1, 1, 1, 1, 1,
-1.241377, 0.1294119, -3.261122, 1, 1, 1, 1, 1,
-1.236127, -0.320082, -2.387777, 1, 1, 1, 1, 1,
-1.233899, 0.7878187, -1.337516, 1, 1, 1, 1, 1,
-1.229501, 0.310779, -2.749666, 1, 1, 1, 1, 1,
-1.228325, -0.4415275, -2.115103, 1, 1, 1, 1, 1,
-1.215775, -0.3519496, -2.111007, 1, 1, 1, 1, 1,
-1.215698, -0.6371874, -2.08874, 1, 1, 1, 1, 1,
-1.206787, -0.659716, -2.775878, 1, 1, 1, 1, 1,
-1.202932, -0.2701479, -0.3892781, 1, 1, 1, 1, 1,
-1.202052, 0.2013886, -0.9737207, 1, 1, 1, 1, 1,
-1.198453, 1.388936, -2.546136, 1, 1, 1, 1, 1,
-1.196297, 0.4121808, -0.6123642, 0, 0, 1, 1, 1,
-1.193841, -0.5233425, -2.138717, 1, 0, 0, 1, 1,
-1.19003, -1.475516, -3.806324, 1, 0, 0, 1, 1,
-1.189463, -0.3728946, -1.241938, 1, 0, 0, 1, 1,
-1.17273, -0.8843108, -2.537582, 1, 0, 0, 1, 1,
-1.171062, 1.527567, -1.668156, 1, 0, 0, 1, 1,
-1.168199, 1.101496, -1.346994, 0, 0, 0, 1, 1,
-1.16788, 0.3834974, -2.953816, 0, 0, 0, 1, 1,
-1.157022, 1.307064, -0.7659946, 0, 0, 0, 1, 1,
-1.156485, -0.6817754, -2.893127, 0, 0, 0, 1, 1,
-1.152503, 1.06319, -1.784943, 0, 0, 0, 1, 1,
-1.139065, -0.7112107, -2.26639, 0, 0, 0, 1, 1,
-1.138972, 0.9115538, -2.681568, 0, 0, 0, 1, 1,
-1.127362, -2.184815, -3.109973, 1, 1, 1, 1, 1,
-1.127, -0.4113506, -3.444556, 1, 1, 1, 1, 1,
-1.120948, -0.03894755, -0.6392599, 1, 1, 1, 1, 1,
-1.117676, -0.5929005, -4.255967, 1, 1, 1, 1, 1,
-1.103361, -1.256712, -3.242526, 1, 1, 1, 1, 1,
-1.101867, 0.5054513, -1.059406, 1, 1, 1, 1, 1,
-1.093761, -0.5633017, -2.536256, 1, 1, 1, 1, 1,
-1.085629, -0.6863572, -0.9220083, 1, 1, 1, 1, 1,
-1.085457, 0.1002845, -1.624321, 1, 1, 1, 1, 1,
-1.083482, 0.06273594, -3.47678, 1, 1, 1, 1, 1,
-1.082558, -1.722041, -1.834248, 1, 1, 1, 1, 1,
-1.077999, 2.578863, -0.279604, 1, 1, 1, 1, 1,
-1.075703, -0.3519427, -1.29383, 1, 1, 1, 1, 1,
-1.074135, 0.8942468, -1.39713, 1, 1, 1, 1, 1,
-1.070014, -2.00901, -4.431898, 1, 1, 1, 1, 1,
-1.058121, -1.383009, -2.662179, 0, 0, 1, 1, 1,
-1.054933, -1.313263, -2.988142, 1, 0, 0, 1, 1,
-1.047815, 0.5285471, 0.4655963, 1, 0, 0, 1, 1,
-1.038222, -0.8394378, -1.966632, 1, 0, 0, 1, 1,
-1.033216, -0.1599167, -1.385486, 1, 0, 0, 1, 1,
-1.028372, -0.7603099, -1.6413, 1, 0, 0, 1, 1,
-1.025334, -0.04526959, -1.474021, 0, 0, 0, 1, 1,
-1.019726, -0.07194545, -2.05575, 0, 0, 0, 1, 1,
-1.006777, 0.7669668, -2.532283, 0, 0, 0, 1, 1,
-0.9939177, -1.146053, -3.21998, 0, 0, 0, 1, 1,
-0.9929969, -0.6059933, -1.843039, 0, 0, 0, 1, 1,
-0.989396, -1.56611, -0.8318605, 0, 0, 0, 1, 1,
-0.9857599, -0.3586028, -0.9929295, 0, 0, 0, 1, 1,
-0.980092, -0.370269, -0.9501927, 1, 1, 1, 1, 1,
-0.9797646, 0.1312352, -1.395863, 1, 1, 1, 1, 1,
-0.9618064, 0.2544807, -0.789255, 1, 1, 1, 1, 1,
-0.9613298, 0.6803265, -0.4361193, 1, 1, 1, 1, 1,
-0.9485754, -0.6158214, -1.996078, 1, 1, 1, 1, 1,
-0.9455076, -0.02582989, -0.4212787, 1, 1, 1, 1, 1,
-0.9448427, -0.3545037, -0.7047619, 1, 1, 1, 1, 1,
-0.9423378, 2.259732, -0.5224043, 1, 1, 1, 1, 1,
-0.9420815, -0.1760861, -1.534707, 1, 1, 1, 1, 1,
-0.9417486, -0.9850265, -3.662789, 1, 1, 1, 1, 1,
-0.9315912, 0.8400719, -1.729465, 1, 1, 1, 1, 1,
-0.9291941, 0.2974051, 0.2171067, 1, 1, 1, 1, 1,
-0.9289558, -0.1286008, -1.533769, 1, 1, 1, 1, 1,
-0.9272649, -0.2480479, -1.51413, 1, 1, 1, 1, 1,
-0.927153, -1.231029, -0.5911712, 1, 1, 1, 1, 1,
-0.9256218, 1.256461, -1.211967, 0, 0, 1, 1, 1,
-0.9172774, 0.7481246, -0.06288017, 1, 0, 0, 1, 1,
-0.9087628, -0.7503322, -2.231817, 1, 0, 0, 1, 1,
-0.9073445, -1.662617, -3.658838, 1, 0, 0, 1, 1,
-0.9045318, 1.074382, -0.4045385, 1, 0, 0, 1, 1,
-0.9013587, -0.6415252, -3.616087, 1, 0, 0, 1, 1,
-0.899789, 1.117644, -0.6872891, 0, 0, 0, 1, 1,
-0.8808621, -1.150334, -3.681151, 0, 0, 0, 1, 1,
-0.876361, -0.7851268, -2.255481, 0, 0, 0, 1, 1,
-0.8740539, -0.9047421, -1.527446, 0, 0, 0, 1, 1,
-0.8718036, -1.370427, -2.246663, 0, 0, 0, 1, 1,
-0.870137, -0.695694, -4.234907, 0, 0, 0, 1, 1,
-0.8617991, -1.034369, -2.656479, 0, 0, 0, 1, 1,
-0.8601081, -1.104705, -1.44585, 1, 1, 1, 1, 1,
-0.8535448, -0.38239, -2.518371, 1, 1, 1, 1, 1,
-0.8521983, 0.8405368, -0.1973359, 1, 1, 1, 1, 1,
-0.8507981, 0.5396334, 0.1012701, 1, 1, 1, 1, 1,
-0.84607, 0.4353058, -1.349828, 1, 1, 1, 1, 1,
-0.8386441, -0.6149216, -1.942888, 1, 1, 1, 1, 1,
-0.8379718, 0.7277026, -0.8861427, 1, 1, 1, 1, 1,
-0.8273866, -1.285038, -2.338659, 1, 1, 1, 1, 1,
-0.8213585, -1.386429, -1.891241, 1, 1, 1, 1, 1,
-0.8194831, -0.3684672, -2.766526, 1, 1, 1, 1, 1,
-0.818405, 0.001453039, -2.681587, 1, 1, 1, 1, 1,
-0.8174859, 2.016344, -0.584307, 1, 1, 1, 1, 1,
-0.8143901, 1.537586, -0.4524765, 1, 1, 1, 1, 1,
-0.8030578, 0.9366699, -0.9586499, 1, 1, 1, 1, 1,
-0.7975975, -0.06133024, -1.009421, 1, 1, 1, 1, 1,
-0.795014, -0.5600261, -3.307081, 0, 0, 1, 1, 1,
-0.7854012, -0.4438281, -3.711058, 1, 0, 0, 1, 1,
-0.7824875, 1.892414, -0.6882303, 1, 0, 0, 1, 1,
-0.7779161, -0.2618348, -2.261612, 1, 0, 0, 1, 1,
-0.7757829, 0.8040718, -0.2652322, 1, 0, 0, 1, 1,
-0.7681646, 2.120355, -1.179364, 1, 0, 0, 1, 1,
-0.7661235, 0.9660535, 0.1284969, 0, 0, 0, 1, 1,
-0.7648344, 0.9459066, -0.7277505, 0, 0, 0, 1, 1,
-0.7639894, 0.7241729, -1.673993, 0, 0, 0, 1, 1,
-0.763735, -1.726357, -1.22981, 0, 0, 0, 1, 1,
-0.7627307, -0.09953064, -3.842398, 0, 0, 0, 1, 1,
-0.7622821, -0.1337889, -2.095548, 0, 0, 0, 1, 1,
-0.7583114, -1.477894, -2.682199, 0, 0, 0, 1, 1,
-0.7570748, -0.197501, -0.5007817, 1, 1, 1, 1, 1,
-0.7457752, -1.411011, -1.821204, 1, 1, 1, 1, 1,
-0.7355419, 1.957399, 0.205072, 1, 1, 1, 1, 1,
-0.7351409, 0.2328452, -1.689526, 1, 1, 1, 1, 1,
-0.729853, 0.7726971, -2.404208, 1, 1, 1, 1, 1,
-0.7237909, -2.37313, -2.705779, 1, 1, 1, 1, 1,
-0.7206451, 0.216841, -0.8879726, 1, 1, 1, 1, 1,
-0.7177753, -0.007399875, -2.285488, 1, 1, 1, 1, 1,
-0.7169103, -0.8419966, -2.122662, 1, 1, 1, 1, 1,
-0.7146547, -1.226409, -2.481949, 1, 1, 1, 1, 1,
-0.7136517, -0.1958123, -1.482277, 1, 1, 1, 1, 1,
-0.710876, -0.8901267, 0.2864559, 1, 1, 1, 1, 1,
-0.7070799, 0.6649171, 0.1993131, 1, 1, 1, 1, 1,
-0.7050293, -0.1686351, -2.153213, 1, 1, 1, 1, 1,
-0.7034901, 1.033894, -1.281351, 1, 1, 1, 1, 1,
-0.7023993, -0.01896623, -0.7705194, 0, 0, 1, 1, 1,
-0.6995649, -0.1670706, -1.580577, 1, 0, 0, 1, 1,
-0.6990658, 0.212159, -0.2547512, 1, 0, 0, 1, 1,
-0.6926455, 0.670064, -1.533421, 1, 0, 0, 1, 1,
-0.6921865, -0.1894692, -1.385814, 1, 0, 0, 1, 1,
-0.6857305, 1.49989, -0.8040034, 1, 0, 0, 1, 1,
-0.6857196, -0.2718354, -2.634552, 0, 0, 0, 1, 1,
-0.6838484, 0.7407573, 1.197212, 0, 0, 0, 1, 1,
-0.6833534, -0.8591336, -2.767797, 0, 0, 0, 1, 1,
-0.6803382, 0.4899191, -2.618, 0, 0, 0, 1, 1,
-0.6755269, -1.112787, -3.705311, 0, 0, 0, 1, 1,
-0.6667168, -2.412984, -3.214717, 0, 0, 0, 1, 1,
-0.6626036, -0.3450182, -3.491025, 0, 0, 0, 1, 1,
-0.6581516, 1.763386, -0.4742673, 1, 1, 1, 1, 1,
-0.6577495, -0.6949769, -0.7974175, 1, 1, 1, 1, 1,
-0.6563698, -0.5696814, -1.109352, 1, 1, 1, 1, 1,
-0.6546001, 1.618705, 0.975881, 1, 1, 1, 1, 1,
-0.6517947, -1.54176, -2.521508, 1, 1, 1, 1, 1,
-0.6455064, -0.1563001, -0.8841696, 1, 1, 1, 1, 1,
-0.6314897, 0.9058517, 1.007017, 1, 1, 1, 1, 1,
-0.6311465, 0.3700165, -0.9864344, 1, 1, 1, 1, 1,
-0.6309451, -0.09093574, -2.778381, 1, 1, 1, 1, 1,
-0.6308182, 0.2712548, -1.429806, 1, 1, 1, 1, 1,
-0.6280777, -0.5071562, -2.091964, 1, 1, 1, 1, 1,
-0.6246358, 0.115997, 0.9242129, 1, 1, 1, 1, 1,
-0.6238291, -1.124159, -2.994918, 1, 1, 1, 1, 1,
-0.6148421, 0.6707549, -1.31465, 1, 1, 1, 1, 1,
-0.6142145, 1.087524, -1.083977, 1, 1, 1, 1, 1,
-0.6132588, 0.8190992, -1.159145, 0, 0, 1, 1, 1,
-0.6118229, 0.08196846, -2.60494, 1, 0, 0, 1, 1,
-0.6080772, 1.839017, 0.6868806, 1, 0, 0, 1, 1,
-0.6010033, 2.142671, 1.452617, 1, 0, 0, 1, 1,
-0.6000752, -0.06521677, -1.187065, 1, 0, 0, 1, 1,
-0.6000182, 2.430124, -0.3958312, 1, 0, 0, 1, 1,
-0.5984808, -0.8563452, -3.896821, 0, 0, 0, 1, 1,
-0.5979054, 0.1630426, -2.451464, 0, 0, 0, 1, 1,
-0.5946004, 2.000922, -0.8625213, 0, 0, 0, 1, 1,
-0.5929938, 0.2461908, -1.657016, 0, 0, 0, 1, 1,
-0.5928829, -1.044858, -2.416811, 0, 0, 0, 1, 1,
-0.5867338, 0.9536411, -2.956248, 0, 0, 0, 1, 1,
-0.5850477, 0.9031883, -0.2959608, 0, 0, 0, 1, 1,
-0.57942, 0.8263491, -1.132345, 1, 1, 1, 1, 1,
-0.5719014, 0.3004125, -2.259732, 1, 1, 1, 1, 1,
-0.5614499, 0.8229862, -1.648776, 1, 1, 1, 1, 1,
-0.5503658, -1.556061, -0.9954324, 1, 1, 1, 1, 1,
-0.5483735, -0.1318994, -2.413576, 1, 1, 1, 1, 1,
-0.547834, -0.08093166, 0.6285361, 1, 1, 1, 1, 1,
-0.5456466, 2.417325, 1.057678, 1, 1, 1, 1, 1,
-0.5432357, 0.001814863, -1.602092, 1, 1, 1, 1, 1,
-0.5399709, 1.84211, 0.9791016, 1, 1, 1, 1, 1,
-0.5334594, -1.900165, -2.069369, 1, 1, 1, 1, 1,
-0.5288282, 0.1523539, -2.28761, 1, 1, 1, 1, 1,
-0.5271191, -0.02474431, -2.073382, 1, 1, 1, 1, 1,
-0.5261921, 1.704978, 0.1738677, 1, 1, 1, 1, 1,
-0.5244234, 0.6726521, -0.5948182, 1, 1, 1, 1, 1,
-0.5216172, -0.5965248, -2.517105, 1, 1, 1, 1, 1,
-0.5198935, -0.9394891, -2.113255, 0, 0, 1, 1, 1,
-0.5159101, -0.111406, -1.403943, 1, 0, 0, 1, 1,
-0.5126392, -0.09451795, -2.144087, 1, 0, 0, 1, 1,
-0.5103028, 0.6099722, -1.651674, 1, 0, 0, 1, 1,
-0.5071373, -0.9934954, -4.384731, 1, 0, 0, 1, 1,
-0.5069453, 0.05297647, -1.967601, 1, 0, 0, 1, 1,
-0.5020071, 0.475944, -0.9981706, 0, 0, 0, 1, 1,
-0.4994901, 0.6163117, -0.3403174, 0, 0, 0, 1, 1,
-0.496009, 0.8563424, 1.153688, 0, 0, 0, 1, 1,
-0.4959495, 1.19742, 0.2603736, 0, 0, 0, 1, 1,
-0.4907624, 0.3351722, 0.008962913, 0, 0, 0, 1, 1,
-0.4875695, -1.016059, -1.661364, 0, 0, 0, 1, 1,
-0.485809, 1.485561, 0.299294, 0, 0, 0, 1, 1,
-0.4846721, -0.3693628, -1.22126, 1, 1, 1, 1, 1,
-0.4835064, -1.27115, -3.710419, 1, 1, 1, 1, 1,
-0.4831352, -0.4683686, -2.468321, 1, 1, 1, 1, 1,
-0.4781582, 0.4270022, -2.113091, 1, 1, 1, 1, 1,
-0.4731467, 0.8526509, -0.5083496, 1, 1, 1, 1, 1,
-0.4671008, 1.758098, -0.1820707, 1, 1, 1, 1, 1,
-0.4665589, 1.644369, 0.6079867, 1, 1, 1, 1, 1,
-0.4663043, 0.5398505, -1.525558, 1, 1, 1, 1, 1,
-0.4629713, 1.179994, 0.6963791, 1, 1, 1, 1, 1,
-0.4591656, 1.184381, -0.6741696, 1, 1, 1, 1, 1,
-0.4556537, -1.557253, -3.026601, 1, 1, 1, 1, 1,
-0.4510666, 1.764837, -0.01030435, 1, 1, 1, 1, 1,
-0.4472754, -0.8480257, -3.687349, 1, 1, 1, 1, 1,
-0.444362, -0.8452111, -3.59965, 1, 1, 1, 1, 1,
-0.4386587, 0.8245599, -2.032383, 1, 1, 1, 1, 1,
-0.4386067, 2.004661, -0.17931, 0, 0, 1, 1, 1,
-0.4385816, 0.5499508, -1.981844, 1, 0, 0, 1, 1,
-0.4357055, 1.288058, 0.3439383, 1, 0, 0, 1, 1,
-0.4347234, -0.01952454, -1.533378, 1, 0, 0, 1, 1,
-0.4328975, -0.301829, -0.5757341, 1, 0, 0, 1, 1,
-0.4325063, 1.272882, 1.697017, 1, 0, 0, 1, 1,
-0.4317812, -0.7641027, -1.797349, 0, 0, 0, 1, 1,
-0.4317627, -0.7850701, -3.546347, 0, 0, 0, 1, 1,
-0.4291991, -0.05632884, -2.335281, 0, 0, 0, 1, 1,
-0.4257138, 0.5548923, -1.048652, 0, 0, 0, 1, 1,
-0.4256397, 1.933396, -2.019277, 0, 0, 0, 1, 1,
-0.4252784, -1.424508, -2.959672, 0, 0, 0, 1, 1,
-0.4252593, 1.13944, -0.3157535, 0, 0, 0, 1, 1,
-0.4219653, -0.7968968, -2.134676, 1, 1, 1, 1, 1,
-0.4170074, 0.4419049, -0.2972952, 1, 1, 1, 1, 1,
-0.4146169, -0.5391164, -1.449599, 1, 1, 1, 1, 1,
-0.4128487, 1.294381, -0.105881, 1, 1, 1, 1, 1,
-0.4102939, 0.4015159, -0.4821756, 1, 1, 1, 1, 1,
-0.4096968, -0.2659916, -4.301034, 1, 1, 1, 1, 1,
-0.4096868, 0.6326052, -2.061358, 1, 1, 1, 1, 1,
-0.408931, -0.5126281, -4.138356, 1, 1, 1, 1, 1,
-0.4070382, 0.2481448, -0.2984419, 1, 1, 1, 1, 1,
-0.4058917, 1.34726, -0.06536423, 1, 1, 1, 1, 1,
-0.4009806, -1.042956, -3.216371, 1, 1, 1, 1, 1,
-0.3973893, 0.9617155, -1.132609, 1, 1, 1, 1, 1,
-0.3870671, 1.553275, -2.546978, 1, 1, 1, 1, 1,
-0.3852398, 1.094186, -1.161018, 1, 1, 1, 1, 1,
-0.3816172, 1.425205, 1.635918, 1, 1, 1, 1, 1,
-0.3803947, 0.1808828, -0.8973059, 0, 0, 1, 1, 1,
-0.3799784, 0.30084, -2.456338, 1, 0, 0, 1, 1,
-0.3777381, 0.5045566, 1.107854, 1, 0, 0, 1, 1,
-0.3692894, -0.2710318, -2.116296, 1, 0, 0, 1, 1,
-0.368209, 0.4158812, -0.7470738, 1, 0, 0, 1, 1,
-0.3644295, 0.008616366, -2.684854, 1, 0, 0, 1, 1,
-0.364413, 0.6025105, 1.345073, 0, 0, 0, 1, 1,
-0.3642041, 0.2967389, -0.4534506, 0, 0, 0, 1, 1,
-0.3625257, 0.9003073, 0.8632951, 0, 0, 0, 1, 1,
-0.3624144, 2.464445, -0.4680973, 0, 0, 0, 1, 1,
-0.3609244, 0.4345716, -3.704808, 0, 0, 0, 1, 1,
-0.3589379, -0.5117362, -2.242602, 0, 0, 0, 1, 1,
-0.3573686, -0.4263534, -4.095939, 0, 0, 0, 1, 1,
-0.3555935, -0.9490473, -2.391382, 1, 1, 1, 1, 1,
-0.3533935, 0.674476, -0.2547839, 1, 1, 1, 1, 1,
-0.3519377, -1.531912, -3.212097, 1, 1, 1, 1, 1,
-0.3515403, -1.430912, -4.227624, 1, 1, 1, 1, 1,
-0.3457014, 0.8167089, -0.4889328, 1, 1, 1, 1, 1,
-0.3446696, 0.5701231, 1.056366, 1, 1, 1, 1, 1,
-0.3438076, -0.6663079, -2.918419, 1, 1, 1, 1, 1,
-0.3407055, 1.024523, 0.5653288, 1, 1, 1, 1, 1,
-0.3405743, -1.084604, -3.651798, 1, 1, 1, 1, 1,
-0.3387804, -0.4993119, -1.157139, 1, 1, 1, 1, 1,
-0.3299613, 0.5495486, -1.863856, 1, 1, 1, 1, 1,
-0.3297351, 0.2598236, -0.2844816, 1, 1, 1, 1, 1,
-0.329213, 1.513717, -0.2055514, 1, 1, 1, 1, 1,
-0.3263533, -1.601908, -2.735547, 1, 1, 1, 1, 1,
-0.3246819, -0.254728, -0.9916294, 1, 1, 1, 1, 1,
-0.3187546, -1.168602, -3.403375, 0, 0, 1, 1, 1,
-0.3186817, -0.5704767, -2.147338, 1, 0, 0, 1, 1,
-0.3156001, -0.2586638, -2.068132, 1, 0, 0, 1, 1,
-0.3149355, -1.074355, -2.114311, 1, 0, 0, 1, 1,
-0.3140872, -1.614313, -1.665415, 1, 0, 0, 1, 1,
-0.3083691, 0.9693068, -0.5634906, 1, 0, 0, 1, 1,
-0.3074033, 2.52985, -1.779068, 0, 0, 0, 1, 1,
-0.3065883, 0.6005112, -0.2269796, 0, 0, 0, 1, 1,
-0.3039137, -0.4754762, -3.342153, 0, 0, 0, 1, 1,
-0.3000153, 1.701035, 1.392657, 0, 0, 0, 1, 1,
-0.2979307, -1.764152, -2.68352, 0, 0, 0, 1, 1,
-0.2951142, 0.4625998, -0.6231699, 0, 0, 0, 1, 1,
-0.2942213, 0.2994028, 1.0668, 0, 0, 0, 1, 1,
-0.2939052, -1.632041, -1.162748, 1, 1, 1, 1, 1,
-0.2892658, 0.1476659, -1.486622, 1, 1, 1, 1, 1,
-0.2888656, 0.3144936, 0.6368646, 1, 1, 1, 1, 1,
-0.2869167, -1.491679, -1.561532, 1, 1, 1, 1, 1,
-0.2865567, -0.114731, -1.489295, 1, 1, 1, 1, 1,
-0.2857774, 1.132222, 1.147797, 1, 1, 1, 1, 1,
-0.2846449, -0.1927313, -2.290424, 1, 1, 1, 1, 1,
-0.2821739, 1.713405, 0.3835442, 1, 1, 1, 1, 1,
-0.2767476, -0.3678219, -4.510757, 1, 1, 1, 1, 1,
-0.2753555, 1.243246, -0.1411098, 1, 1, 1, 1, 1,
-0.2736368, 0.2129238, -1.480691, 1, 1, 1, 1, 1,
-0.2677839, 0.9551786, -0.210025, 1, 1, 1, 1, 1,
-0.2672753, 0.9886431, -1.261432, 1, 1, 1, 1, 1,
-0.2663595, 0.2568415, -0.01715701, 1, 1, 1, 1, 1,
-0.2662058, -0.09140027, -2.898362, 1, 1, 1, 1, 1,
-0.2653431, -1.561397, -3.470685, 0, 0, 1, 1, 1,
-0.2586161, -0.5098115, -1.712735, 1, 0, 0, 1, 1,
-0.2546249, 1.391342, -0.1428528, 1, 0, 0, 1, 1,
-0.252215, -1.395569, -4.113381, 1, 0, 0, 1, 1,
-0.2514817, 0.8597426, -0.0005523934, 1, 0, 0, 1, 1,
-0.2497763, -0.8030186, -2.420752, 1, 0, 0, 1, 1,
-0.2491519, -1.453164, -2.955606, 0, 0, 0, 1, 1,
-0.2489157, -0.006265594, -3.431741, 0, 0, 0, 1, 1,
-0.2438658, 2.431244, 0.2959018, 0, 0, 0, 1, 1,
-0.2393597, 2.208175, -1.052622, 0, 0, 0, 1, 1,
-0.2387275, 0.4516949, 0.3393082, 0, 0, 0, 1, 1,
-0.2281876, -0.1087707, -2.421315, 0, 0, 0, 1, 1,
-0.2237798, 0.4911199, -2.037452, 0, 0, 0, 1, 1,
-0.2188975, 0.3176714, 0.007789116, 1, 1, 1, 1, 1,
-0.215782, 1.155529, 0.5684676, 1, 1, 1, 1, 1,
-0.2144424, 1.231917, 0.5682725, 1, 1, 1, 1, 1,
-0.2141214, 1.653449, 0.7620554, 1, 1, 1, 1, 1,
-0.2136043, -2.18617, -3.279247, 1, 1, 1, 1, 1,
-0.2133276, 0.3603095, -0.189137, 1, 1, 1, 1, 1,
-0.2093903, -1.065455, -4.257382, 1, 1, 1, 1, 1,
-0.2072293, 0.1729523, -0.7885577, 1, 1, 1, 1, 1,
-0.2060278, -0.3796839, -2.750209, 1, 1, 1, 1, 1,
-0.2059764, -1.228151, -1.589333, 1, 1, 1, 1, 1,
-0.2021787, -1.598169, -3.228498, 1, 1, 1, 1, 1,
-0.2017202, -0.8239001, -3.60088, 1, 1, 1, 1, 1,
-0.2000817, 1.024899, -1.29611, 1, 1, 1, 1, 1,
-0.1999858, 0.5913702, 1.657029, 1, 1, 1, 1, 1,
-0.1986034, 0.4799385, -1.822995, 1, 1, 1, 1, 1,
-0.1971248, -0.4557174, -2.241213, 0, 0, 1, 1, 1,
-0.1924343, 1.055862, -0.09355084, 1, 0, 0, 1, 1,
-0.190854, -1.391655, -2.593068, 1, 0, 0, 1, 1,
-0.1881058, 2.405957, 0.3699931, 1, 0, 0, 1, 1,
-0.1872088, 0.1585419, -0.945398, 1, 0, 0, 1, 1,
-0.1843095, -0.7669684, -4.199686, 1, 0, 0, 1, 1,
-0.1817624, 1.232592, -0.1606271, 0, 0, 0, 1, 1,
-0.1808803, 0.6844593, 0.6857629, 0, 0, 0, 1, 1,
-0.1808099, -0.342875, -2.413962, 0, 0, 0, 1, 1,
-0.1781349, -2.553009, -3.51864, 0, 0, 0, 1, 1,
-0.1737984, 1.344722, 0.318114, 0, 0, 0, 1, 1,
-0.1640133, 1.884989, 0.06198894, 0, 0, 0, 1, 1,
-0.163352, -0.446338, -1.932668, 0, 0, 0, 1, 1,
-0.163292, 2.492541, 0.07338569, 1, 1, 1, 1, 1,
-0.1626151, 0.1589094, -0.6590456, 1, 1, 1, 1, 1,
-0.1624752, -0.3382507, -2.638878, 1, 1, 1, 1, 1,
-0.159126, -1.158026, -3.090204, 1, 1, 1, 1, 1,
-0.1590537, -1.131586, -1.162549, 1, 1, 1, 1, 1,
-0.1588693, -0.00600338, -0.3775612, 1, 1, 1, 1, 1,
-0.1560256, -0.1150687, -3.949338, 1, 1, 1, 1, 1,
-0.1547204, -0.2488691, -1.894869, 1, 1, 1, 1, 1,
-0.1466128, 0.2885067, -1.357811, 1, 1, 1, 1, 1,
-0.144173, 0.6986182, -1.84273, 1, 1, 1, 1, 1,
-0.1439532, 0.02299567, -2.351925, 1, 1, 1, 1, 1,
-0.1433782, -0.9392843, -2.950563, 1, 1, 1, 1, 1,
-0.141831, 0.4714831, -0.2225054, 1, 1, 1, 1, 1,
-0.1410921, 0.1005087, -0.6338146, 1, 1, 1, 1, 1,
-0.1405478, 2.974278, 1.110117, 1, 1, 1, 1, 1,
-0.1385341, -1.102129, -2.772078, 0, 0, 1, 1, 1,
-0.1376962, 1.41539, 2.157453, 1, 0, 0, 1, 1,
-0.1375315, 0.4823924, 0.2432193, 1, 0, 0, 1, 1,
-0.1373179, -1.33926, -3.731083, 1, 0, 0, 1, 1,
-0.1372342, 0.03797149, -3.265812, 1, 0, 0, 1, 1,
-0.1360399, -0.819307, -4.557036, 1, 0, 0, 1, 1,
-0.133141, 0.2530015, 0.2224515, 0, 0, 0, 1, 1,
-0.1328408, 0.5675258, -0.9564486, 0, 0, 0, 1, 1,
-0.1324138, -0.5747283, -5.158033, 0, 0, 0, 1, 1,
-0.1310205, 0.09455541, -0.451916, 0, 0, 0, 1, 1,
-0.1283828, 0.2846897, 1.158726, 0, 0, 0, 1, 1,
-0.1279887, -0.4462709, -2.591602, 0, 0, 0, 1, 1,
-0.1279032, -1.298882, -2.886989, 0, 0, 0, 1, 1,
-0.1261059, 1.956046, -1.932576, 1, 1, 1, 1, 1,
-0.1228047, -0.4379623, -3.436342, 1, 1, 1, 1, 1,
-0.1209943, -2.435635, -2.853843, 1, 1, 1, 1, 1,
-0.1199238, -1.01899, -2.515992, 1, 1, 1, 1, 1,
-0.1170642, -0.1081149, -2.029802, 1, 1, 1, 1, 1,
-0.1137494, -0.2874852, -1.174061, 1, 1, 1, 1, 1,
-0.1086278, -0.6128222, -3.855167, 1, 1, 1, 1, 1,
-0.09668553, 0.4850041, -1.074056, 1, 1, 1, 1, 1,
-0.08893779, -0.3824328, -1.509554, 1, 1, 1, 1, 1,
-0.0866501, 0.1735104, -1.050216, 1, 1, 1, 1, 1,
-0.08655573, 0.1706872, -0.6810427, 1, 1, 1, 1, 1,
-0.0826845, 0.1218821, -0.4239288, 1, 1, 1, 1, 1,
-0.08032698, -0.5472884, -1.941168, 1, 1, 1, 1, 1,
-0.07719319, 0.3666347, -0.4969009, 1, 1, 1, 1, 1,
-0.07676592, -0.4314329, -2.319638, 1, 1, 1, 1, 1,
-0.07619575, 0.8851891, -2.791633, 0, 0, 1, 1, 1,
-0.07570337, -0.9122603, -3.229018, 1, 0, 0, 1, 1,
-0.07489835, 0.3170651, 0.7218511, 1, 0, 0, 1, 1,
-0.072293, 2.210299, -0.7450505, 1, 0, 0, 1, 1,
-0.07208019, -0.3110056, -5.214663, 1, 0, 0, 1, 1,
-0.07032482, -0.5185955, -4.41689, 1, 0, 0, 1, 1,
-0.06803416, -1.970165, -3.58698, 0, 0, 0, 1, 1,
-0.0652406, 1.086653, -0.7419059, 0, 0, 0, 1, 1,
-0.06499852, 0.01207129, -2.065899, 0, 0, 0, 1, 1,
-0.06468642, -1.393499, -3.073856, 0, 0, 0, 1, 1,
-0.06403253, -0.6096355, -1.903628, 0, 0, 0, 1, 1,
-0.06358954, -0.03174772, -0.7429432, 0, 0, 0, 1, 1,
-0.06118479, 0.4030834, -0.7488918, 0, 0, 0, 1, 1,
-0.05942633, -0.2779355, -2.713555, 1, 1, 1, 1, 1,
-0.05773487, 0.4345796, 0.742679, 1, 1, 1, 1, 1,
-0.05720778, 1.353533, 0.04368933, 1, 1, 1, 1, 1,
-0.05594848, -0.9363605, -2.206435, 1, 1, 1, 1, 1,
-0.05588613, 0.947641, -1.177273, 1, 1, 1, 1, 1,
-0.05577584, 1.233263, 0.1337689, 1, 1, 1, 1, 1,
-0.04725364, 1.046242, 0.5945999, 1, 1, 1, 1, 1,
-0.04368382, -0.3327347, -2.827268, 1, 1, 1, 1, 1,
-0.04163263, -0.5121372, -2.522905, 1, 1, 1, 1, 1,
-0.04027585, 0.8125736, -0.9762632, 1, 1, 1, 1, 1,
-0.03752271, -0.5597016, -2.64219, 1, 1, 1, 1, 1,
-0.03655133, -1.133494, -4.22928, 1, 1, 1, 1, 1,
-0.03599104, -0.5072801, -1.504942, 1, 1, 1, 1, 1,
-0.03527021, 0.135842, 1.854901, 1, 1, 1, 1, 1,
-0.0269951, -1.463256, -3.816221, 1, 1, 1, 1, 1,
-0.02571269, 0.5453627, 0.03695596, 0, 0, 1, 1, 1,
-0.02182722, -1.107472, -3.304575, 1, 0, 0, 1, 1,
-0.01355733, -0.04021375, -3.783545, 1, 0, 0, 1, 1,
-0.008465089, -0.6839727, -2.629849, 1, 0, 0, 1, 1,
-0.003526717, -1.216843, -0.9107714, 1, 0, 0, 1, 1,
-0.003336043, 0.3253521, 0.3038183, 1, 0, 0, 1, 1,
0.0006404926, -1.441057, 3.866728, 0, 0, 0, 1, 1,
0.00590128, -0.2623972, 3.042474, 0, 0, 0, 1, 1,
0.006121519, -1.667176, 4.754503, 0, 0, 0, 1, 1,
0.01132615, 0.1482161, -0.04355757, 0, 0, 0, 1, 1,
0.01366888, 0.1256169, -1.485031, 0, 0, 0, 1, 1,
0.01463986, -0.008097804, 2.755342, 0, 0, 0, 1, 1,
0.01935666, -1.511965, 2.615854, 0, 0, 0, 1, 1,
0.0201773, 1.05833, 1.001334, 1, 1, 1, 1, 1,
0.02129941, 0.7439731, 0.1030179, 1, 1, 1, 1, 1,
0.02433278, -0.7667335, 2.592137, 1, 1, 1, 1, 1,
0.02608557, 1.892057, 0.9599199, 1, 1, 1, 1, 1,
0.02610247, 1.746351, 1.625391, 1, 1, 1, 1, 1,
0.02892243, 0.3694875, -0.2601047, 1, 1, 1, 1, 1,
0.03148648, 1.128504, -0.7256277, 1, 1, 1, 1, 1,
0.03341372, -0.3507617, 2.117992, 1, 1, 1, 1, 1,
0.03729165, 0.5845595, 0.882436, 1, 1, 1, 1, 1,
0.03781945, 0.9483181, -1.017059, 1, 1, 1, 1, 1,
0.03998009, -0.5053756, 3.557399, 1, 1, 1, 1, 1,
0.04608018, 0.5247561, -0.3986077, 1, 1, 1, 1, 1,
0.04983193, 0.8919272, -1.819533, 1, 1, 1, 1, 1,
0.05060251, -0.005643743, 0.3124372, 1, 1, 1, 1, 1,
0.05188295, -1.668288, 4.306377, 1, 1, 1, 1, 1,
0.0546147, 0.0764327, 0.4541196, 0, 0, 1, 1, 1,
0.05585438, 0.4473383, 2.211623, 1, 0, 0, 1, 1,
0.05882963, -0.8212258, 1.653412, 1, 0, 0, 1, 1,
0.05989285, -1.377335, 4.826905, 1, 0, 0, 1, 1,
0.06064999, -0.542698, 4.140326, 1, 0, 0, 1, 1,
0.06823338, 0.04319457, 1.017421, 1, 0, 0, 1, 1,
0.07181993, 0.5426131, -1.324706, 0, 0, 0, 1, 1,
0.07226655, 0.1061532, -0.8296413, 0, 0, 0, 1, 1,
0.0727586, -1.687219, 3.810685, 0, 0, 0, 1, 1,
0.07515302, -0.698289, 1.895289, 0, 0, 0, 1, 1,
0.07758211, -0.9862232, 2.990186, 0, 0, 0, 1, 1,
0.08797964, -1.481305, 2.953304, 0, 0, 0, 1, 1,
0.08849926, 1.397717, 0.5933296, 0, 0, 0, 1, 1,
0.09019586, 0.5105674, -2.298802, 1, 1, 1, 1, 1,
0.09308839, 0.7699798, -0.5161605, 1, 1, 1, 1, 1,
0.09460023, 1.905548, -1.495591, 1, 1, 1, 1, 1,
0.1049594, 0.1584665, 1.47401, 1, 1, 1, 1, 1,
0.1069876, 1.240094, -0.7812522, 1, 1, 1, 1, 1,
0.1086862, -1.246172, 2.104495, 1, 1, 1, 1, 1,
0.1113199, -0.6124716, 3.749796, 1, 1, 1, 1, 1,
0.115729, -0.3529421, 1.562415, 1, 1, 1, 1, 1,
0.1187549, -3.06692, 3.333365, 1, 1, 1, 1, 1,
0.1214289, 0.7248845, 0.8561763, 1, 1, 1, 1, 1,
0.1227831, 0.2974228, -0.197262, 1, 1, 1, 1, 1,
0.1271973, 0.6115984, 2.048575, 1, 1, 1, 1, 1,
0.1276135, -0.1468887, 2.193821, 1, 1, 1, 1, 1,
0.1280331, -0.01739088, 1.192546, 1, 1, 1, 1, 1,
0.1304176, -2.873172, 6.102667, 1, 1, 1, 1, 1,
0.1330844, 1.520578, 0.6045969, 0, 0, 1, 1, 1,
0.1339819, -0.4144583, 2.237225, 1, 0, 0, 1, 1,
0.1343206, 0.8603144, 1.146971, 1, 0, 0, 1, 1,
0.1372645, 0.2392346, 0.04616345, 1, 0, 0, 1, 1,
0.1373542, -1.401294, 3.167993, 1, 0, 0, 1, 1,
0.1410122, 0.3872383, -0.032825, 1, 0, 0, 1, 1,
0.1423585, -0.1658397, 2.25711, 0, 0, 0, 1, 1,
0.1453264, 1.156757, -0.1054905, 0, 0, 0, 1, 1,
0.1492653, -0.4886194, 1.698594, 0, 0, 0, 1, 1,
0.1519325, -1.777337, 2.241431, 0, 0, 0, 1, 1,
0.1534642, -1.060391, 2.356768, 0, 0, 0, 1, 1,
0.1536074, 0.9464048, 0.1610276, 0, 0, 0, 1, 1,
0.1540053, 0.5724367, 0.2190733, 0, 0, 0, 1, 1,
0.1569015, -1.305027, 6.257231, 1, 1, 1, 1, 1,
0.1572106, -1.012204, 3.263428, 1, 1, 1, 1, 1,
0.1588142, 0.4122374, 0.8541738, 1, 1, 1, 1, 1,
0.1632188, 0.7869661, -0.9084987, 1, 1, 1, 1, 1,
0.1649956, -0.6962115, 2.423419, 1, 1, 1, 1, 1,
0.1669035, -0.01205093, 0.9233717, 1, 1, 1, 1, 1,
0.1705156, 0.2151929, 0.6212406, 1, 1, 1, 1, 1,
0.1741161, -0.6736451, 4.737925, 1, 1, 1, 1, 1,
0.174521, 1.124795, 0.384536, 1, 1, 1, 1, 1,
0.1749507, 1.821191, 1.624888, 1, 1, 1, 1, 1,
0.1768881, -0.1314464, 1.117393, 1, 1, 1, 1, 1,
0.1783769, 1.440734, -0.1475102, 1, 1, 1, 1, 1,
0.1787659, 1.015016, -0.7641348, 1, 1, 1, 1, 1,
0.1855213, -0.3808114, 3.165624, 1, 1, 1, 1, 1,
0.1873699, -1.445879, 1.185681, 1, 1, 1, 1, 1,
0.187473, 1.365085, 0.3939147, 0, 0, 1, 1, 1,
0.1882972, 2.134431, 0.4538752, 1, 0, 0, 1, 1,
0.1885396, -1.156319, 4.504709, 1, 0, 0, 1, 1,
0.1929414, -1.834782, 2.554412, 1, 0, 0, 1, 1,
0.1990428, -0.4518791, 2.745785, 1, 0, 0, 1, 1,
0.2003912, -0.8771365, 4.322969, 1, 0, 0, 1, 1,
0.2004967, 2.82028, -0.4270557, 0, 0, 0, 1, 1,
0.2033198, 0.7588052, -0.1390161, 0, 0, 0, 1, 1,
0.2066127, 0.24221, -0.0516538, 0, 0, 0, 1, 1,
0.20833, 0.2173516, 0.7562141, 0, 0, 0, 1, 1,
0.2086316, -1.865017, 2.265923, 0, 0, 0, 1, 1,
0.2129202, -0.9007192, 1.589074, 0, 0, 0, 1, 1,
0.2164937, 0.1997591, 1.688399, 0, 0, 0, 1, 1,
0.2232533, -0.951493, 3.316956, 1, 1, 1, 1, 1,
0.2256098, 0.4290311, 0.05203104, 1, 1, 1, 1, 1,
0.2271284, 0.9964001, -0.08355158, 1, 1, 1, 1, 1,
0.2309334, 0.07417118, 2.836351, 1, 1, 1, 1, 1,
0.2344854, 0.6519724, -0.4510455, 1, 1, 1, 1, 1,
0.2359123, 1.27316, -0.7872466, 1, 1, 1, 1, 1,
0.2359728, 0.9527156, 1.789294, 1, 1, 1, 1, 1,
0.2395837, 0.5984705, -1.285043, 1, 1, 1, 1, 1,
0.2433574, -0.168815, 2.059053, 1, 1, 1, 1, 1,
0.2444452, -0.08141427, 1.787966, 1, 1, 1, 1, 1,
0.2504453, 0.1795789, 0.4735091, 1, 1, 1, 1, 1,
0.2511052, 0.8508436, -0.7015916, 1, 1, 1, 1, 1,
0.252519, -1.994978, 3.417284, 1, 1, 1, 1, 1,
0.256315, 1.732487, 0.9438067, 1, 1, 1, 1, 1,
0.2580373, -0.4576147, 3.663591, 1, 1, 1, 1, 1,
0.2608906, 0.1274828, 1.043501, 0, 0, 1, 1, 1,
0.2639425, 0.6294331, 0.1070961, 1, 0, 0, 1, 1,
0.2664448, 0.4051562, -0.1345602, 1, 0, 0, 1, 1,
0.267598, 0.9716319, 0.4137575, 1, 0, 0, 1, 1,
0.2696835, -1.364319, 5.515362, 1, 0, 0, 1, 1,
0.2779276, -0.9885745, 3.564845, 1, 0, 0, 1, 1,
0.2855607, -0.355685, 1.072262, 0, 0, 0, 1, 1,
0.286053, 0.07406056, 1.516825, 0, 0, 0, 1, 1,
0.2899927, -1.472616, 3.088526, 0, 0, 0, 1, 1,
0.2932511, -0.1933246, 1.084987, 0, 0, 0, 1, 1,
0.3016134, -0.6647888, 3.575102, 0, 0, 0, 1, 1,
0.3047235, -0.9088407, 1.912565, 0, 0, 0, 1, 1,
0.3076484, -1.090496, 2.770247, 0, 0, 0, 1, 1,
0.3076928, 0.7398429, -0.1271731, 1, 1, 1, 1, 1,
0.3100791, -0.6404873, 2.465579, 1, 1, 1, 1, 1,
0.3131752, 0.396602, 1.808137, 1, 1, 1, 1, 1,
0.317082, -0.3728712, 0.7097016, 1, 1, 1, 1, 1,
0.3180121, 1.042539, -0.1376352, 1, 1, 1, 1, 1,
0.3188615, 0.8682714, 0.2415369, 1, 1, 1, 1, 1,
0.3213688, -2.130356, 1.989872, 1, 1, 1, 1, 1,
0.3237251, -0.1092249, 2.878201, 1, 1, 1, 1, 1,
0.3241879, 1.23918, 0.5997888, 1, 1, 1, 1, 1,
0.3251721, 0.008230274, 2.946142, 1, 1, 1, 1, 1,
0.3259658, -1.871829, 5.125327, 1, 1, 1, 1, 1,
0.3297495, 0.2997721, -0.100628, 1, 1, 1, 1, 1,
0.3337456, 0.4298921, 0.3442805, 1, 1, 1, 1, 1,
0.3442656, -1.309106, 3.115696, 1, 1, 1, 1, 1,
0.3447645, 0.2813542, 1.854686, 1, 1, 1, 1, 1,
0.3494934, 0.7750266, 2.006424, 0, 0, 1, 1, 1,
0.3507812, -1.498246, 3.80361, 1, 0, 0, 1, 1,
0.3531213, 0.2239647, 1.350898, 1, 0, 0, 1, 1,
0.3552347, -1.703858, 4.133632, 1, 0, 0, 1, 1,
0.3576327, 0.2015483, 2.590681, 1, 0, 0, 1, 1,
0.3577277, -0.4581763, 4.446683, 1, 0, 0, 1, 1,
0.3653653, -0.1504607, 2.238728, 0, 0, 0, 1, 1,
0.3690065, -1.384387, 3.347484, 0, 0, 0, 1, 1,
0.3696669, 0.1005777, 1.337853, 0, 0, 0, 1, 1,
0.3712565, -0.4568875, 3.295861, 0, 0, 0, 1, 1,
0.3731105, 0.1509042, 1.351076, 0, 0, 0, 1, 1,
0.3734255, -1.106876, 3.796522, 0, 0, 0, 1, 1,
0.38375, 0.5026392, 0.9189698, 0, 0, 0, 1, 1,
0.3855862, 0.8828121, -0.2756341, 1, 1, 1, 1, 1,
0.3860532, 0.8452169, 0.409796, 1, 1, 1, 1, 1,
0.3876129, -1.604255, 3.30069, 1, 1, 1, 1, 1,
0.3882109, -0.7608965, 2.901031, 1, 1, 1, 1, 1,
0.388823, -1.538521, 2.983668, 1, 1, 1, 1, 1,
0.3910456, -0.6306695, 0.3148683, 1, 1, 1, 1, 1,
0.3915617, -0.6123973, 2.748168, 1, 1, 1, 1, 1,
0.3933506, -0.1481505, 0.1998301, 1, 1, 1, 1, 1,
0.3955066, -0.2660362, 0.5401065, 1, 1, 1, 1, 1,
0.397745, 0.05660436, 2.345827, 1, 1, 1, 1, 1,
0.4008444, -0.8980836, 2.889021, 1, 1, 1, 1, 1,
0.4008774, 0.05773485, 2.014546, 1, 1, 1, 1, 1,
0.4082292, -0.2987607, 2.118636, 1, 1, 1, 1, 1,
0.4128174, 0.6346382, -1.422836, 1, 1, 1, 1, 1,
0.4160147, 0.135852, -1.558923, 1, 1, 1, 1, 1,
0.4191459, 1.378587, 0.1328974, 0, 0, 1, 1, 1,
0.4226573, 0.1577694, 0.2812955, 1, 0, 0, 1, 1,
0.4271313, 0.9146391, 0.3510364, 1, 0, 0, 1, 1,
0.4271385, -0.005710501, 1.267245, 1, 0, 0, 1, 1,
0.427949, 1.623168, 0.1009862, 1, 0, 0, 1, 1,
0.428279, -1.265651, 2.322337, 1, 0, 0, 1, 1,
0.4309632, -0.3458872, 2.022835, 0, 0, 0, 1, 1,
0.4316475, -0.2514017, 2.303714, 0, 0, 0, 1, 1,
0.4323941, 0.5133067, 1.519093, 0, 0, 0, 1, 1,
0.4342027, 0.1473972, 0.2963733, 0, 0, 0, 1, 1,
0.4348294, 1.164648, 1.682971, 0, 0, 0, 1, 1,
0.4371118, -0.04382191, 2.208841, 0, 0, 0, 1, 1,
0.4411898, -0.09041456, 1.550572, 0, 0, 0, 1, 1,
0.4458242, -0.7367072, 1.468734, 1, 1, 1, 1, 1,
0.4482937, 1.002884, -0.4728597, 1, 1, 1, 1, 1,
0.4496777, 1.287481, -1.995945, 1, 1, 1, 1, 1,
0.4523155, -0.8017438, 4.106278, 1, 1, 1, 1, 1,
0.4624877, -0.6007509, 1.551841, 1, 1, 1, 1, 1,
0.4639821, -0.3264749, -0.02193108, 1, 1, 1, 1, 1,
0.4664207, 0.1101513, 1.473411, 1, 1, 1, 1, 1,
0.4687155, -0.5808128, 1.575019, 1, 1, 1, 1, 1,
0.4753341, -0.1605523, 1.293299, 1, 1, 1, 1, 1,
0.4756362, 0.3660452, 0.7847353, 1, 1, 1, 1, 1,
0.4761734, 0.3731572, 1.364972, 1, 1, 1, 1, 1,
0.4777384, -0.261084, -0.163148, 1, 1, 1, 1, 1,
0.4796363, 0.7091555, -0.2147686, 1, 1, 1, 1, 1,
0.4861839, -1.300351, 2.876097, 1, 1, 1, 1, 1,
0.4920238, 1.002145, 0.636366, 1, 1, 1, 1, 1,
0.5016621, 1.475142, -1.250737, 0, 0, 1, 1, 1,
0.5036539, 0.7700554, 0.2397681, 1, 0, 0, 1, 1,
0.5104247, -0.9739134, 3.29223, 1, 0, 0, 1, 1,
0.5111043, -0.6220786, 2.529424, 1, 0, 0, 1, 1,
0.5142034, -1.441555, 0.9652868, 1, 0, 0, 1, 1,
0.5155193, 0.585364, 0.5941008, 1, 0, 0, 1, 1,
0.5170701, -1.883981, 2.84182, 0, 0, 0, 1, 1,
0.5192546, -0.06048534, 0.6762931, 0, 0, 0, 1, 1,
0.5230097, -1.865223, 3.900948, 0, 0, 0, 1, 1,
0.5346225, 0.5547947, -0.4023161, 0, 0, 0, 1, 1,
0.5409287, 0.6683844, 1.72391, 0, 0, 0, 1, 1,
0.5429049, 0.2945926, 2.548656, 0, 0, 0, 1, 1,
0.5433983, 2.706521, 0.04534198, 0, 0, 0, 1, 1,
0.5465699, 1.135564, 0.05470812, 1, 1, 1, 1, 1,
0.5471514, -1.608854, 4.158776, 1, 1, 1, 1, 1,
0.5531932, 1.370042, 0.8685931, 1, 1, 1, 1, 1,
0.5613721, 1.643814, 1.667245, 1, 1, 1, 1, 1,
0.5654723, 0.03196592, 0.5677321, 1, 1, 1, 1, 1,
0.5692372, -2.084282, 2.722039, 1, 1, 1, 1, 1,
0.5716174, -0.1091443, 3.049025, 1, 1, 1, 1, 1,
0.573892, -0.8631787, 1.269709, 1, 1, 1, 1, 1,
0.5741907, 0.4583909, 2.292483, 1, 1, 1, 1, 1,
0.5762127, 0.6351801, 0.9789664, 1, 1, 1, 1, 1,
0.5767782, 0.846225, -0.4070881, 1, 1, 1, 1, 1,
0.5768321, -0.01561635, 2.922716, 1, 1, 1, 1, 1,
0.5784225, 0.05295337, -0.817782, 1, 1, 1, 1, 1,
0.5792783, 0.124073, 1.675671, 1, 1, 1, 1, 1,
0.5801668, -1.133881, 1.943662, 1, 1, 1, 1, 1,
0.581686, -1.384144, 3.864999, 0, 0, 1, 1, 1,
0.5821216, 1.388299, -0.9965702, 1, 0, 0, 1, 1,
0.5856254, -1.305449, 4.072168, 1, 0, 0, 1, 1,
0.5934181, -0.2649184, 1.247668, 1, 0, 0, 1, 1,
0.5952721, -0.9743434, 2.461722, 1, 0, 0, 1, 1,
0.6013967, -0.5232496, 0.5475346, 1, 0, 0, 1, 1,
0.6039593, 2.418858, 2.14609, 0, 0, 0, 1, 1,
0.6068003, -0.9362395, 2.446542, 0, 0, 0, 1, 1,
0.6073961, -0.4759955, 3.050448, 0, 0, 0, 1, 1,
0.6117384, -0.2432583, 3.643178, 0, 0, 0, 1, 1,
0.6139761, 0.5765688, 1.029413, 0, 0, 0, 1, 1,
0.6157275, -0.3718111, 1.329359, 0, 0, 0, 1, 1,
0.6169751, 0.341574, 1.006747, 0, 0, 0, 1, 1,
0.6320798, -1.880123, 2.412491, 1, 1, 1, 1, 1,
0.6334684, -0.5397674, 3.648281, 1, 1, 1, 1, 1,
0.6349422, -0.7685229, 3.347114, 1, 1, 1, 1, 1,
0.6364154, 0.7136924, 1.686349, 1, 1, 1, 1, 1,
0.6451685, -1.114877, 2.299648, 1, 1, 1, 1, 1,
0.6469348, 0.7579803, 1.68062, 1, 1, 1, 1, 1,
0.6476126, -0.03904717, 2.20077, 1, 1, 1, 1, 1,
0.6552389, -1.28506, 2.979268, 1, 1, 1, 1, 1,
0.660574, -0.5861158, 1.268473, 1, 1, 1, 1, 1,
0.6611636, -0.330963, 2.254761, 1, 1, 1, 1, 1,
0.661849, -1.635315, 0.6038284, 1, 1, 1, 1, 1,
0.6639562, 1.448031, 0.391638, 1, 1, 1, 1, 1,
0.6641901, -0.5490602, 1.495203, 1, 1, 1, 1, 1,
0.6675758, -1.389095, 4.653953, 1, 1, 1, 1, 1,
0.6678973, -1.44366, 2.947644, 1, 1, 1, 1, 1,
0.6696889, 1.313792, -1.830904, 0, 0, 1, 1, 1,
0.6697531, -0.05710044, 1.202289, 1, 0, 0, 1, 1,
0.6739969, 0.7072221, 1.207108, 1, 0, 0, 1, 1,
0.6767298, -0.609042, 2.581209, 1, 0, 0, 1, 1,
0.6775772, 0.9114302, 0.5703451, 1, 0, 0, 1, 1,
0.6900255, 0.8129675, -0.002051326, 1, 0, 0, 1, 1,
0.6945743, 0.4772269, 2.363347, 0, 0, 0, 1, 1,
0.6971873, -0.7436997, 1.506702, 0, 0, 0, 1, 1,
0.6972524, 0.7506691, 1.804547, 0, 0, 0, 1, 1,
0.7003078, -0.7653943, 2.030937, 0, 0, 0, 1, 1,
0.7005855, 0.624664, 0.8733382, 0, 0, 0, 1, 1,
0.7056359, 1.005149, -0.289605, 0, 0, 0, 1, 1,
0.7078435, -0.6673792, 3.071243, 0, 0, 0, 1, 1,
0.7120082, 2.026577, 0.9009442, 1, 1, 1, 1, 1,
0.7128944, 0.5338917, -0.6250813, 1, 1, 1, 1, 1,
0.7151935, -1.211813, 2.891376, 1, 1, 1, 1, 1,
0.7161462, -0.04777249, 3.193132, 1, 1, 1, 1, 1,
0.7188715, -0.02589376, 1.106935, 1, 1, 1, 1, 1,
0.7256793, -0.04701585, 2.73044, 1, 1, 1, 1, 1,
0.7296132, 1.324746, -0.00351344, 1, 1, 1, 1, 1,
0.7317104, 1.018565, 0.9414623, 1, 1, 1, 1, 1,
0.7321792, -0.432932, 1.970659, 1, 1, 1, 1, 1,
0.7325234, -0.5379539, 2.341895, 1, 1, 1, 1, 1,
0.7349159, 0.8792235, 0.6429312, 1, 1, 1, 1, 1,
0.7362686, 0.3159947, 3.658844, 1, 1, 1, 1, 1,
0.7400912, -0.4729272, 1.348932, 1, 1, 1, 1, 1,
0.7423877, 0.4671054, 1.556247, 1, 1, 1, 1, 1,
0.7428799, -0.5339402, 2.02562, 1, 1, 1, 1, 1,
0.7468407, 0.3897721, 1.328947, 0, 0, 1, 1, 1,
0.7480575, -0.5812262, 2.238473, 1, 0, 0, 1, 1,
0.75255, -0.5979877, 2.854623, 1, 0, 0, 1, 1,
0.7546, 0.6693857, 0.3897318, 1, 0, 0, 1, 1,
0.7622395, -0.73277, 1.873938, 1, 0, 0, 1, 1,
0.7628843, -0.0857109, 2.204116, 1, 0, 0, 1, 1,
0.7768177, 0.6181305, 0.6795625, 0, 0, 0, 1, 1,
0.7773303, 1.023457, 0.1105929, 0, 0, 0, 1, 1,
0.7803051, -0.5148298, 2.274373, 0, 0, 0, 1, 1,
0.7808896, -1.476161, 4.597693, 0, 0, 0, 1, 1,
0.7837521, 0.2985036, 1.058312, 0, 0, 0, 1, 1,
0.7857121, 0.8758013, -0.3495017, 0, 0, 0, 1, 1,
0.78847, 0.4602395, 2.105869, 0, 0, 0, 1, 1,
0.7970401, 0.693846, 1.141844, 1, 1, 1, 1, 1,
0.8006222, 2.040435, -1.861443, 1, 1, 1, 1, 1,
0.8222594, 1.49588, 1.747947, 1, 1, 1, 1, 1,
0.8242985, -1.657126, 1.324303, 1, 1, 1, 1, 1,
0.8340536, -0.267648, 1.486341, 1, 1, 1, 1, 1,
0.8383213, -0.6263644, 1.586179, 1, 1, 1, 1, 1,
0.8431935, 0.8370348, 1.135979, 1, 1, 1, 1, 1,
0.843424, -1.788589, 3.440065, 1, 1, 1, 1, 1,
0.8494885, -0.8018387, 3.822973, 1, 1, 1, 1, 1,
0.8503491, -0.6931137, 2.239662, 1, 1, 1, 1, 1,
0.8547016, 0.329424, 0.2399788, 1, 1, 1, 1, 1,
0.8565619, -0.2810719, 3.077507, 1, 1, 1, 1, 1,
0.8569605, 0.04853033, 1.600831, 1, 1, 1, 1, 1,
0.8580992, -1.269319, 1.698673, 1, 1, 1, 1, 1,
0.8629141, 1.468204, 0.9996181, 1, 1, 1, 1, 1,
0.8651127, -2.975942, 3.47, 0, 0, 1, 1, 1,
0.866846, 0.5955771, 1.357343, 1, 0, 0, 1, 1,
0.8689274, -1.670365, 1.569483, 1, 0, 0, 1, 1,
0.8690166, -0.1269813, 0.7966125, 1, 0, 0, 1, 1,
0.8717599, -1.713232, 3.566195, 1, 0, 0, 1, 1,
0.8771527, 0.2678668, 1.628782, 1, 0, 0, 1, 1,
0.8787451, -2.124776, 2.773927, 0, 0, 0, 1, 1,
0.8858162, 0.0058865, 2.783651, 0, 0, 0, 1, 1,
0.8860502, 0.7676094, -0.817733, 0, 0, 0, 1, 1,
0.8926708, -1.052983, 2.24098, 0, 0, 0, 1, 1,
0.8951845, -0.04481483, 2.417812, 0, 0, 0, 1, 1,
0.8974387, -0.3881741, -0.6316887, 0, 0, 0, 1, 1,
0.8977964, 0.5839351, 1.587501, 0, 0, 0, 1, 1,
0.898017, 0.2539629, 1.519546, 1, 1, 1, 1, 1,
0.9030085, -0.7458891, 0.2056493, 1, 1, 1, 1, 1,
0.9072185, -1.747093, 2.627075, 1, 1, 1, 1, 1,
0.9086493, -0.740728, 1.913034, 1, 1, 1, 1, 1,
0.9126449, -0.2724136, 2.363096, 1, 1, 1, 1, 1,
0.9184831, -0.4265168, 2.430484, 1, 1, 1, 1, 1,
0.9218616, -0.08380309, 0.1497096, 1, 1, 1, 1, 1,
0.9316054, -0.04189319, 1.787863, 1, 1, 1, 1, 1,
0.9352194, -0.2558739, 1.072896, 1, 1, 1, 1, 1,
0.9373852, 0.2537347, 0.9321207, 1, 1, 1, 1, 1,
0.9379268, -1.109682, 0.7749068, 1, 1, 1, 1, 1,
0.9404693, -1.417239, 3.26874, 1, 1, 1, 1, 1,
0.9466352, 1.731745, 0.1744315, 1, 1, 1, 1, 1,
0.9634283, 0.4535131, 2.637673, 1, 1, 1, 1, 1,
0.9648595, -0.2523716, 3.542382, 1, 1, 1, 1, 1,
0.96527, 0.007266446, 1.318104, 0, 0, 1, 1, 1,
0.9674573, -0.2065639, 0.5951155, 1, 0, 0, 1, 1,
0.9740494, 0.2927494, 0.8777451, 1, 0, 0, 1, 1,
0.97453, -1.348136, 2.322646, 1, 0, 0, 1, 1,
0.9777319, 0.3205571, 1.420441, 1, 0, 0, 1, 1,
0.9781966, -0.6743525, 1.972363, 1, 0, 0, 1, 1,
0.9855471, -1.438972, 3.839118, 0, 0, 0, 1, 1,
0.987239, 0.4743499, 0.2770696, 0, 0, 0, 1, 1,
0.9875373, 0.6640546, 2.250648, 0, 0, 0, 1, 1,
0.9900118, -0.003560585, 0.08253908, 0, 0, 0, 1, 1,
1.003973, 0.2982613, 0.1575355, 0, 0, 0, 1, 1,
1.011326, -1.391895, 1.019302, 0, 0, 0, 1, 1,
1.013626, -0.2022911, 2.141607, 0, 0, 0, 1, 1,
1.024513, 0.9421386, 0.3491058, 1, 1, 1, 1, 1,
1.031783, 0.5234644, 1.186219, 1, 1, 1, 1, 1,
1.032709, -0.6158544, 2.465979, 1, 1, 1, 1, 1,
1.03656, -0.1434036, 1.299636, 1, 1, 1, 1, 1,
1.042555, 1.391906, 0.420983, 1, 1, 1, 1, 1,
1.044238, -0.6594619, 1.955336, 1, 1, 1, 1, 1,
1.059635, 0.6147356, 1.809374, 1, 1, 1, 1, 1,
1.065781, 1.428392, 1.630666, 1, 1, 1, 1, 1,
1.071875, 0.9107289, 1.837096, 1, 1, 1, 1, 1,
1.076736, -1.434883, -0.0594858, 1, 1, 1, 1, 1,
1.084704, 1.142709, 1.028266, 1, 1, 1, 1, 1,
1.086296, 0.5487987, 0.6521688, 1, 1, 1, 1, 1,
1.090978, -0.3988999, 2.913817, 1, 1, 1, 1, 1,
1.098355, -0.3587023, 2.147248, 1, 1, 1, 1, 1,
1.100158, 0.9878865, -0.43755, 1, 1, 1, 1, 1,
1.101975, 0.4471124, 1.33548, 0, 0, 1, 1, 1,
1.104212, 0.8119654, 0.4530624, 1, 0, 0, 1, 1,
1.116957, -0.9210535, 2.173833, 1, 0, 0, 1, 1,
1.122813, -0.2834348, 0.6917971, 1, 0, 0, 1, 1,
1.126921, -0.9030272, 2.280354, 1, 0, 0, 1, 1,
1.155257, 0.3176615, 1.069171, 1, 0, 0, 1, 1,
1.156829, -0.8654814, 1.925819, 0, 0, 0, 1, 1,
1.166327, 2.251095, 1.185862, 0, 0, 0, 1, 1,
1.174565, 0.02508269, 1.288568, 0, 0, 0, 1, 1,
1.1871, 0.3382181, 1.311863, 0, 0, 0, 1, 1,
1.191669, 0.1708134, 2.128812, 0, 0, 0, 1, 1,
1.197661, 0.3105692, 1.718063, 0, 0, 0, 1, 1,
1.203012, -1.229566, 3.105475, 0, 0, 0, 1, 1,
1.206682, -0.3276265, 2.263963, 1, 1, 1, 1, 1,
1.208753, 0.1593125, 1.436474, 1, 1, 1, 1, 1,
1.218789, -1.1318, 2.703532, 1, 1, 1, 1, 1,
1.23145, -1.417135, 3.358607, 1, 1, 1, 1, 1,
1.242696, 1.042295, 0.5033852, 1, 1, 1, 1, 1,
1.254673, 0.6641735, -0.8339534, 1, 1, 1, 1, 1,
1.258389, 2.095458, 2.137562, 1, 1, 1, 1, 1,
1.258417, 0.954729, 1.560263, 1, 1, 1, 1, 1,
1.259422, -0.2374277, -0.4793392, 1, 1, 1, 1, 1,
1.262333, -1.365842, 2.194698, 1, 1, 1, 1, 1,
1.26403, -1.490074, 2.217899, 1, 1, 1, 1, 1,
1.266937, -1.019001, 2.152449, 1, 1, 1, 1, 1,
1.268494, 0.1045385, 3.165952, 1, 1, 1, 1, 1,
1.279132, -0.5266789, 2.181611, 1, 1, 1, 1, 1,
1.2902, 0.1635568, 0.8350862, 1, 1, 1, 1, 1,
1.304937, 0.3976892, 2.535997, 0, 0, 1, 1, 1,
1.316231, -0.1024386, 1.304348, 1, 0, 0, 1, 1,
1.329194, -1.912889, 3.800851, 1, 0, 0, 1, 1,
1.331956, 1.432545, 0.8484377, 1, 0, 0, 1, 1,
1.342046, 0.9029271, 0.8644463, 1, 0, 0, 1, 1,
1.34747, -0.412783, 1.995824, 1, 0, 0, 1, 1,
1.352814, 0.5502561, 0.5442536, 0, 0, 0, 1, 1,
1.359098, 1.592929, -0.06980003, 0, 0, 0, 1, 1,
1.371525, -0.531687, 2.51487, 0, 0, 0, 1, 1,
1.374344, -0.7386788, 4.277561, 0, 0, 0, 1, 1,
1.374949, -0.3397056, 1.821852, 0, 0, 0, 1, 1,
1.382662, -1.362847, 1.756333, 0, 0, 0, 1, 1,
1.388681, -1.194754, 1.640414, 0, 0, 0, 1, 1,
1.397998, -0.08689812, 0.8732952, 1, 1, 1, 1, 1,
1.40196, -1.182046, 1.147864, 1, 1, 1, 1, 1,
1.404612, 0.06154032, 1.24267, 1, 1, 1, 1, 1,
1.434468, -0.485423, 2.773932, 1, 1, 1, 1, 1,
1.450799, -1.061436, 2.239379, 1, 1, 1, 1, 1,
1.457693, 0.190749, 2.320211, 1, 1, 1, 1, 1,
1.458752, -1.443991, 1.665641, 1, 1, 1, 1, 1,
1.473857, 2.041194, 0.9557254, 1, 1, 1, 1, 1,
1.48712, -0.0005716111, 1.103788, 1, 1, 1, 1, 1,
1.494158, -1.140509, 1.209787, 1, 1, 1, 1, 1,
1.49745, -1.052883, 2.015801, 1, 1, 1, 1, 1,
1.498173, -0.3245598, 1.278937, 1, 1, 1, 1, 1,
1.506781, 0.2188242, 1.694381, 1, 1, 1, 1, 1,
1.523499, 1.092625, 2.030662, 1, 1, 1, 1, 1,
1.529556, 0.5922733, -1.250417, 1, 1, 1, 1, 1,
1.5298, -2.339041, 1.679599, 0, 0, 1, 1, 1,
1.533447, -1.775949, 1.618403, 1, 0, 0, 1, 1,
1.534931, -0.2598749, 2.921837, 1, 0, 0, 1, 1,
1.540282, 1.267222, 0.4947589, 1, 0, 0, 1, 1,
1.550792, -0.2487084, 2.38779, 1, 0, 0, 1, 1,
1.553757, 1.209385, -0.5130605, 1, 0, 0, 1, 1,
1.558378, 0.3149517, 0.236698, 0, 0, 0, 1, 1,
1.566188, 0.8787614, 2.005685, 0, 0, 0, 1, 1,
1.568633, 1.424367, 0.3870609, 0, 0, 0, 1, 1,
1.569095, -0.5536559, 1.34163, 0, 0, 0, 1, 1,
1.573542, -0.5773271, 2.905677, 0, 0, 0, 1, 1,
1.582751, -0.9859502, 3.096912, 0, 0, 0, 1, 1,
1.586974, 1.8487, -0.3902822, 0, 0, 0, 1, 1,
1.587641, -0.5379022, 2.98824, 1, 1, 1, 1, 1,
1.592664, 0.5096535, 0.8649908, 1, 1, 1, 1, 1,
1.62743, 0.04572889, 0.1565058, 1, 1, 1, 1, 1,
1.644154, 1.283399, 0.2280184, 1, 1, 1, 1, 1,
1.656955, -0.008571764, 2.008968, 1, 1, 1, 1, 1,
1.676023, -0.1405484, 1.202901, 1, 1, 1, 1, 1,
1.687435, -0.3850995, 1.452676, 1, 1, 1, 1, 1,
1.695359, 0.5106946, 2.53005, 1, 1, 1, 1, 1,
1.697385, -0.02314884, 1.998075, 1, 1, 1, 1, 1,
1.722005, -1.484055, 2.920031, 1, 1, 1, 1, 1,
1.722302, -1.047408, 2.035339, 1, 1, 1, 1, 1,
1.724173, 0.8710655, 1.612404, 1, 1, 1, 1, 1,
1.72669, 0.8862811, 1.01593, 1, 1, 1, 1, 1,
1.742154, -0.7357464, 1.841157, 1, 1, 1, 1, 1,
1.746678, -1.688561, 0.3477517, 1, 1, 1, 1, 1,
1.750855, -0.2584882, 1.363756, 0, 0, 1, 1, 1,
1.758597, -1.687131, 1.775946, 1, 0, 0, 1, 1,
1.774506, 1.314073, 0.4082635, 1, 0, 0, 1, 1,
1.822363, 0.5693908, -0.1238627, 1, 0, 0, 1, 1,
1.837751, 0.8734294, 2.182132, 1, 0, 0, 1, 1,
1.846902, 1.162041, 0.350031, 1, 0, 0, 1, 1,
1.870106, 0.1502589, 2.190035, 0, 0, 0, 1, 1,
1.887299, -0.6454438, 1.937924, 0, 0, 0, 1, 1,
1.889727, 0.7222477, 2.518985, 0, 0, 0, 1, 1,
1.905452, -0.7136016, 3.339557, 0, 0, 0, 1, 1,
1.907408, -0.818943, 1.775139, 0, 0, 0, 1, 1,
1.909675, -0.6164144, 3.225516, 0, 0, 0, 1, 1,
1.918017, -1.191671, 2.668978, 0, 0, 0, 1, 1,
1.934033, -0.1705118, 0.6175513, 1, 1, 1, 1, 1,
1.944643, -0.5343005, -0.9909011, 1, 1, 1, 1, 1,
1.990816, 1.581732, 0.2361175, 1, 1, 1, 1, 1,
1.999023, 1.484393, -0.09630977, 1, 1, 1, 1, 1,
2.014413, -1.841576, 0.9467314, 1, 1, 1, 1, 1,
2.024797, -1.164726, 2.823636, 1, 1, 1, 1, 1,
2.040164, -1.055775, 0.7292407, 1, 1, 1, 1, 1,
2.051713, 2.240381, 1.421595, 1, 1, 1, 1, 1,
2.060522, -0.5142883, 0.4710923, 1, 1, 1, 1, 1,
2.06857, -0.09330991, 1.239727, 1, 1, 1, 1, 1,
2.079152, 0.8528742, 2.728946, 1, 1, 1, 1, 1,
2.137889, -0.06259191, 2.671286, 1, 1, 1, 1, 1,
2.146019, -0.1749652, 3.18916, 1, 1, 1, 1, 1,
2.243295, -0.1257017, 2.798024, 1, 1, 1, 1, 1,
2.251594, -0.3168361, 1.376098, 1, 1, 1, 1, 1,
2.253951, 0.6640025, 1.571712, 0, 0, 1, 1, 1,
2.269514, -0.2867311, 1.245636, 1, 0, 0, 1, 1,
2.301814, -0.515893, 1.796768, 1, 0, 0, 1, 1,
2.310115, -0.8843792, 1.695863, 1, 0, 0, 1, 1,
2.336559, -0.5032099, 1.887684, 1, 0, 0, 1, 1,
2.363896, -1.105962, 0.2073934, 1, 0, 0, 1, 1,
2.411781, 0.2827404, 2.185961, 0, 0, 0, 1, 1,
2.509692, 0.1974857, 1.215886, 0, 0, 0, 1, 1,
2.55836, 0.4073558, 0.9103073, 0, 0, 0, 1, 1,
2.610124, -1.319189, 2.867172, 0, 0, 0, 1, 1,
2.618134, 1.088396, 1.975579, 0, 0, 0, 1, 1,
2.635578, 1.648566, 1.069634, 0, 0, 0, 1, 1,
2.656772, -3.040258, 2.509615, 0, 0, 0, 1, 1,
2.659653, -1.07693, 1.570202, 1, 1, 1, 1, 1,
2.678125, -0.8045799, 1.837044, 1, 1, 1, 1, 1,
2.848167, -0.3652939, 1.963728, 1, 1, 1, 1, 1,
3.037689, 0.4703636, 0.8178971, 1, 1, 1, 1, 1,
3.050558, 2.545695, 1.270869, 1, 1, 1, 1, 1,
3.348536, -0.2412555, 2.535592, 1, 1, 1, 1, 1,
3.363952, -0.7813039, 0.8568875, 1, 1, 1, 1, 1
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
var radius = 9.857275;
var distance = 34.62326;
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
mvMatrix.translate( -0.0321877, 0.04632127, -0.5212839 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.62326);
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