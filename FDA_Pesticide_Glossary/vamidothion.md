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
-2.91292, -1.706128, -2.179739, 1, 0, 0, 1,
-2.863469, -0.3432014, -0.9499025, 1, 0.007843138, 0, 1,
-2.827414, -0.670083, -0.7836806, 1, 0.01176471, 0, 1,
-2.736721, -0.290362, -2.006317, 1, 0.01960784, 0, 1,
-2.701245, -0.04290893, 0.5792833, 1, 0.02352941, 0, 1,
-2.679884, -0.2096357, -2.027424, 1, 0.03137255, 0, 1,
-2.580367, 0.5369752, -0.5514606, 1, 0.03529412, 0, 1,
-2.549344, -0.4653468, -1.229157, 1, 0.04313726, 0, 1,
-2.540791, 1.11158, -3.132682, 1, 0.04705882, 0, 1,
-2.525906, -0.2004061, -2.084755, 1, 0.05490196, 0, 1,
-2.506602, 0.145668, -1.794552, 1, 0.05882353, 0, 1,
-2.422837, 0.5775299, -2.206947, 1, 0.06666667, 0, 1,
-2.391341, 0.5613148, -1.085313, 1, 0.07058824, 0, 1,
-2.34783, 0.008847001, -2.6753, 1, 0.07843138, 0, 1,
-2.326236, 2.072083, -0.8967605, 1, 0.08235294, 0, 1,
-2.309882, 0.8517017, -0.3860397, 1, 0.09019608, 0, 1,
-2.300593, 1.268053, -1.683652, 1, 0.09411765, 0, 1,
-2.291462, 0.04764474, -1.585867, 1, 0.1019608, 0, 1,
-2.265539, 0.6262057, -1.959504, 1, 0.1098039, 0, 1,
-2.232349, -0.7702842, 0.2164674, 1, 0.1137255, 0, 1,
-2.220292, 0.3339537, -0.4716035, 1, 0.1215686, 0, 1,
-2.161271, 0.8725427, -1.889488, 1, 0.1254902, 0, 1,
-2.159961, 0.8922768, -1.141234, 1, 0.1333333, 0, 1,
-2.128451, 0.81496, 0.4096105, 1, 0.1372549, 0, 1,
-2.10998, -0.5614219, -2.173784, 1, 0.145098, 0, 1,
-2.104018, -0.5752646, -2.813037, 1, 0.1490196, 0, 1,
-2.102053, 0.38547, -0.1436587, 1, 0.1568628, 0, 1,
-2.067807, -1.153016, -1.180404, 1, 0.1607843, 0, 1,
-2.058841, 0.8357407, -1.778199, 1, 0.1686275, 0, 1,
-2.051154, -1.032582, -3.446557, 1, 0.172549, 0, 1,
-2.024966, 0.6715865, -0.723973, 1, 0.1803922, 0, 1,
-2.005881, 1.031955, -1.822919, 1, 0.1843137, 0, 1,
-1.967951, -0.3499896, -1.360958, 1, 0.1921569, 0, 1,
-1.967737, -0.3676272, -1.991601, 1, 0.1960784, 0, 1,
-1.951955, -0.4769427, -2.128563, 1, 0.2039216, 0, 1,
-1.936832, 0.602205, -1.004482, 1, 0.2117647, 0, 1,
-1.927968, 0.1201884, -0.8415563, 1, 0.2156863, 0, 1,
-1.876876, -0.205426, -2.478551, 1, 0.2235294, 0, 1,
-1.876481, 0.8169059, -2.695984, 1, 0.227451, 0, 1,
-1.868751, -1.323393, -2.465211, 1, 0.2352941, 0, 1,
-1.865731, 2.129844, -0.3355408, 1, 0.2392157, 0, 1,
-1.85149, 0.4405137, -0.3370582, 1, 0.2470588, 0, 1,
-1.842551, -0.3345367, -1.208408, 1, 0.2509804, 0, 1,
-1.837149, -0.04605291, -2.488377, 1, 0.2588235, 0, 1,
-1.833237, -1.466747, -2.931433, 1, 0.2627451, 0, 1,
-1.830471, -0.3109873, -2.896874, 1, 0.2705882, 0, 1,
-1.771166, 0.6849167, -2.325505, 1, 0.2745098, 0, 1,
-1.770898, 0.2410037, -2.251775, 1, 0.282353, 0, 1,
-1.752494, 0.5433648, -1.82777, 1, 0.2862745, 0, 1,
-1.744584, 0.877123, -2.511031, 1, 0.2941177, 0, 1,
-1.735056, 0.2379287, -1.863143, 1, 0.3019608, 0, 1,
-1.733169, -0.06176792, -1.549965, 1, 0.3058824, 0, 1,
-1.686383, 0.4158782, 0.8540215, 1, 0.3137255, 0, 1,
-1.660043, -1.447577, -1.527265, 1, 0.3176471, 0, 1,
-1.65035, -0.3562997, -0.5528953, 1, 0.3254902, 0, 1,
-1.650284, -0.2574064, -1.844231, 1, 0.3294118, 0, 1,
-1.647497, -0.6308537, -1.975993, 1, 0.3372549, 0, 1,
-1.644896, 1.542494, -3.487632, 1, 0.3411765, 0, 1,
-1.643368, -0.695783, -0.881664, 1, 0.3490196, 0, 1,
-1.639397, -0.2399937, -0.3181325, 1, 0.3529412, 0, 1,
-1.620923, -0.1147791, -1.896509, 1, 0.3607843, 0, 1,
-1.619221, -1.92656, -3.192436, 1, 0.3647059, 0, 1,
-1.575828, 1.319405, -3.51832, 1, 0.372549, 0, 1,
-1.567154, 0.1939934, -4.058748, 1, 0.3764706, 0, 1,
-1.565968, -0.1087187, -2.146197, 1, 0.3843137, 0, 1,
-1.564927, 0.05595976, -0.2779382, 1, 0.3882353, 0, 1,
-1.553207, -0.0633634, -1.006607, 1, 0.3960784, 0, 1,
-1.54358, -0.742635, -1.594381, 1, 0.4039216, 0, 1,
-1.535882, -1.331669, -3.08294, 1, 0.4078431, 0, 1,
-1.531751, -2.109968, -2.016437, 1, 0.4156863, 0, 1,
-1.524332, 0.4615455, -0.1881515, 1, 0.4196078, 0, 1,
-1.514816, -1.798425, -2.590977, 1, 0.427451, 0, 1,
-1.508176, -1.49782, -0.9642754, 1, 0.4313726, 0, 1,
-1.504029, -1.793884, -2.802037, 1, 0.4392157, 0, 1,
-1.487628, -2.174487, -2.284982, 1, 0.4431373, 0, 1,
-1.487443, -0.1685525, -1.907071, 1, 0.4509804, 0, 1,
-1.467477, 0.5800709, 0.9559414, 1, 0.454902, 0, 1,
-1.463809, 0.3014236, -0.953319, 1, 0.4627451, 0, 1,
-1.445428, -0.2956997, -1.148219, 1, 0.4666667, 0, 1,
-1.44185, 0.639494, -1.027242, 1, 0.4745098, 0, 1,
-1.435166, 0.8785025, -0.932868, 1, 0.4784314, 0, 1,
-1.42434, -2.069763, -3.148383, 1, 0.4862745, 0, 1,
-1.419351, -0.5148154, -2.103801, 1, 0.4901961, 0, 1,
-1.407504, 0.1451271, 0.2484198, 1, 0.4980392, 0, 1,
-1.406029, 0.6648141, -1.556751, 1, 0.5058824, 0, 1,
-1.401797, 3.514191, -1.557822, 1, 0.509804, 0, 1,
-1.3865, 0.8359539, -0.9621733, 1, 0.5176471, 0, 1,
-1.386347, 1.675815, -0.5742934, 1, 0.5215687, 0, 1,
-1.385726, -1.005751, -3.419949, 1, 0.5294118, 0, 1,
-1.379398, 1.450057, -1.532771, 1, 0.5333334, 0, 1,
-1.378805, -0.2627892, -1.788061, 1, 0.5411765, 0, 1,
-1.376778, 0.2968281, -0.9244254, 1, 0.5450981, 0, 1,
-1.370007, 0.1426295, -0.366181, 1, 0.5529412, 0, 1,
-1.351543, 0.1452137, -2.139247, 1, 0.5568628, 0, 1,
-1.350951, -1.688198, -3.084767, 1, 0.5647059, 0, 1,
-1.348915, 1.093358, -0.58871, 1, 0.5686275, 0, 1,
-1.347868, 0.8377762, 1.003613, 1, 0.5764706, 0, 1,
-1.333331, 0.3653564, -1.055256, 1, 0.5803922, 0, 1,
-1.330038, 0.2367105, -1.618986, 1, 0.5882353, 0, 1,
-1.329105, 0.819973, -1.803071, 1, 0.5921569, 0, 1,
-1.318629, 1.241535, 0.006189915, 1, 0.6, 0, 1,
-1.31602, 0.3104297, -1.530861, 1, 0.6078432, 0, 1,
-1.310024, 0.764471, -0.4789644, 1, 0.6117647, 0, 1,
-1.307542, -2.094388, -1.187734, 1, 0.6196079, 0, 1,
-1.305346, 0.4737216, 0.8173538, 1, 0.6235294, 0, 1,
-1.300495, -0.6397551, -2.540546, 1, 0.6313726, 0, 1,
-1.292565, -1.883915, -2.956872, 1, 0.6352941, 0, 1,
-1.292429, 0.7763584, -1.793766, 1, 0.6431373, 0, 1,
-1.285994, 0.3241723, -0.4211743, 1, 0.6470588, 0, 1,
-1.277252, -1.938994, -2.76179, 1, 0.654902, 0, 1,
-1.275725, -0.6353917, -0.03061238, 1, 0.6588235, 0, 1,
-1.274446, 0.6456314, 0.192882, 1, 0.6666667, 0, 1,
-1.249709, -1.505795, -1.845116, 1, 0.6705883, 0, 1,
-1.248999, 0.2299515, -2.697269, 1, 0.6784314, 0, 1,
-1.240406, 0.782961, -1.627011, 1, 0.682353, 0, 1,
-1.238399, -0.07818276, -0.797662, 1, 0.6901961, 0, 1,
-1.237909, -1.078564, -1.108006, 1, 0.6941177, 0, 1,
-1.229753, 1.488337, -0.5664672, 1, 0.7019608, 0, 1,
-1.225364, -1.167964, -3.817145, 1, 0.7098039, 0, 1,
-1.224954, 1.816185, -2.41998, 1, 0.7137255, 0, 1,
-1.224289, -0.5470573, -1.490742, 1, 0.7215686, 0, 1,
-1.221972, 1.605806, -0.1956085, 1, 0.7254902, 0, 1,
-1.210165, -0.6558406, -3.571518, 1, 0.7333333, 0, 1,
-1.20697, -2.792231, -2.071624, 1, 0.7372549, 0, 1,
-1.188416, 1.241566, -1.130222, 1, 0.7450981, 0, 1,
-1.182563, 1.576654, -1.601075, 1, 0.7490196, 0, 1,
-1.180605, 0.840721, 0.4450891, 1, 0.7568628, 0, 1,
-1.176393, -1.476415, -2.289814, 1, 0.7607843, 0, 1,
-1.172222, -0.1278978, 0.07914282, 1, 0.7686275, 0, 1,
-1.167553, 1.764307, 1.244001, 1, 0.772549, 0, 1,
-1.16589, 1.100909, 0.7036362, 1, 0.7803922, 0, 1,
-1.165504, 0.5727141, 0.2948084, 1, 0.7843137, 0, 1,
-1.165482, 2.192561, -1.322069, 1, 0.7921569, 0, 1,
-1.158888, 1.008043, 0.6715994, 1, 0.7960784, 0, 1,
-1.156121, -1.696524, -3.310493, 1, 0.8039216, 0, 1,
-1.155386, 0.0361243, -2.359563, 1, 0.8117647, 0, 1,
-1.147248, -0.004852577, -1.064947, 1, 0.8156863, 0, 1,
-1.144677, -0.03706656, -2.491863, 1, 0.8235294, 0, 1,
-1.136149, 0.1952396, -1.689931, 1, 0.827451, 0, 1,
-1.131915, -0.2738298, -1.70666, 1, 0.8352941, 0, 1,
-1.131427, -0.7218144, -3.237645, 1, 0.8392157, 0, 1,
-1.127937, -0.09638979, -3.25669, 1, 0.8470588, 0, 1,
-1.124838, -1.351618, -3.287424, 1, 0.8509804, 0, 1,
-1.123433, -0.9426331, -2.133898, 1, 0.8588235, 0, 1,
-1.121065, 0.8193002, -2.447333, 1, 0.8627451, 0, 1,
-1.117822, -0.6462198, -1.377807, 1, 0.8705882, 0, 1,
-1.10429, -0.4057782, -2.195287, 1, 0.8745098, 0, 1,
-1.103106, 2.546915, -0.5517963, 1, 0.8823529, 0, 1,
-1.102241, 0.2786423, -2.464316, 1, 0.8862745, 0, 1,
-1.098338, -0.9626967, -1.167192, 1, 0.8941177, 0, 1,
-1.096515, -0.4837269, -3.259726, 1, 0.8980392, 0, 1,
-1.092193, -1.206186, -1.540877, 1, 0.9058824, 0, 1,
-1.090542, -0.8682833, -1.993062, 1, 0.9137255, 0, 1,
-1.089458, -1.340438, -1.828221, 1, 0.9176471, 0, 1,
-1.086467, 0.9308927, 0.8073043, 1, 0.9254902, 0, 1,
-1.080869, 0.8113469, -0.662779, 1, 0.9294118, 0, 1,
-1.072464, -1.064086, -1.539293, 1, 0.9372549, 0, 1,
-1.064917, -1.423681, -1.187082, 1, 0.9411765, 0, 1,
-1.064378, -1.847327, -3.165516, 1, 0.9490196, 0, 1,
-1.063672, 0.4451645, -1.009726, 1, 0.9529412, 0, 1,
-1.056315, 0.02620798, -1.956264, 1, 0.9607843, 0, 1,
-1.052484, 0.04333747, -2.672878, 1, 0.9647059, 0, 1,
-1.047171, 1.32053, -1.032346, 1, 0.972549, 0, 1,
-1.04631, 0.2463634, -2.042176, 1, 0.9764706, 0, 1,
-1.046222, -0.1022848, -1.355718, 1, 0.9843137, 0, 1,
-1.046036, -1.182082, -2.207834, 1, 0.9882353, 0, 1,
-1.045123, 0.5393816, -0.03612683, 1, 0.9960784, 0, 1,
-1.044064, 0.08825883, -0.5641127, 0.9960784, 1, 0, 1,
-1.03919, 0.1214563, -1.79214, 0.9921569, 1, 0, 1,
-1.033143, 0.4771998, 0.9725723, 0.9843137, 1, 0, 1,
-1.028412, 0.003397523, -1.369779, 0.9803922, 1, 0, 1,
-1.0208, -0.6525263, -0.9603246, 0.972549, 1, 0, 1,
-1.006669, 1.570753, -1.010221, 0.9686275, 1, 0, 1,
-1.005949, 1.280588, -2.107867, 0.9607843, 1, 0, 1,
-1.002028, -0.2626724, -1.24095, 0.9568627, 1, 0, 1,
-0.9919408, -0.712849, -2.517902, 0.9490196, 1, 0, 1,
-0.9888477, -1.053385, -2.204084, 0.945098, 1, 0, 1,
-0.9864353, 0.6471165, 0.4910686, 0.9372549, 1, 0, 1,
-0.9862117, -1.472362, -4.39689, 0.9333333, 1, 0, 1,
-0.9813849, 0.3224218, -0.2002794, 0.9254902, 1, 0, 1,
-0.9765875, -1.189512, -0.165071, 0.9215686, 1, 0, 1,
-0.9686015, -0.8521785, -1.4576, 0.9137255, 1, 0, 1,
-0.9673675, 1.696054, 1.042096, 0.9098039, 1, 0, 1,
-0.9662904, -0.1727941, -0.01270837, 0.9019608, 1, 0, 1,
-0.9655089, -0.00200814, -2.030172, 0.8941177, 1, 0, 1,
-0.9583463, 0.01905254, -3.0904, 0.8901961, 1, 0, 1,
-0.9577377, 0.6828108, -0.9592288, 0.8823529, 1, 0, 1,
-0.9513677, 0.4164873, -1.929079, 0.8784314, 1, 0, 1,
-0.9441807, -0.7102835, -1.407197, 0.8705882, 1, 0, 1,
-0.9399551, 0.5074037, -0.62205, 0.8666667, 1, 0, 1,
-0.9361705, -0.5708621, -1.354004, 0.8588235, 1, 0, 1,
-0.9357294, -1.268471, -2.047223, 0.854902, 1, 0, 1,
-0.9269753, -0.4225625, -2.382691, 0.8470588, 1, 0, 1,
-0.9218073, 0.2716671, -0.5518066, 0.8431373, 1, 0, 1,
-0.9179174, -0.09732569, -1.912822, 0.8352941, 1, 0, 1,
-0.9167466, -1.347452, -3.986706, 0.8313726, 1, 0, 1,
-0.9158905, -2.209987, -1.07238, 0.8235294, 1, 0, 1,
-0.9137017, -1.454717, -2.085082, 0.8196079, 1, 0, 1,
-0.9119951, 0.9827214, -0.559725, 0.8117647, 1, 0, 1,
-0.9089593, -0.7280952, -1.998217, 0.8078431, 1, 0, 1,
-0.9059134, 0.9753602, 0.9307051, 0.8, 1, 0, 1,
-0.9033355, -1.129812, -3.576265, 0.7921569, 1, 0, 1,
-0.8950208, 0.4004782, 0.5788229, 0.7882353, 1, 0, 1,
-0.8880455, 0.06973344, -2.671113, 0.7803922, 1, 0, 1,
-0.881364, 1.856323, -1.08872, 0.7764706, 1, 0, 1,
-0.8796287, 0.3960138, -1.06773, 0.7686275, 1, 0, 1,
-0.8795314, 1.002385, -0.2444315, 0.7647059, 1, 0, 1,
-0.8757247, -0.2453954, -1.971147, 0.7568628, 1, 0, 1,
-0.8730579, -0.9727823, -2.416229, 0.7529412, 1, 0, 1,
-0.8632505, 1.348284, -1.149643, 0.7450981, 1, 0, 1,
-0.858286, 0.6772816, -1.111088, 0.7411765, 1, 0, 1,
-0.848765, -0.428364, -1.549779, 0.7333333, 1, 0, 1,
-0.8456163, -0.3469526, -0.7725139, 0.7294118, 1, 0, 1,
-0.8407397, -0.06191103, -2.392646, 0.7215686, 1, 0, 1,
-0.8395662, -1.284775, -1.889334, 0.7176471, 1, 0, 1,
-0.8382925, 1.147263, 0.5210938, 0.7098039, 1, 0, 1,
-0.8381999, 0.4997267, 0.3500251, 0.7058824, 1, 0, 1,
-0.8378783, -0.6281085, -0.5170873, 0.6980392, 1, 0, 1,
-0.8373693, 0.3220185, -2.492099, 0.6901961, 1, 0, 1,
-0.8348827, 0.8063352, -0.5751787, 0.6862745, 1, 0, 1,
-0.8348821, -0.05226158, -2.266194, 0.6784314, 1, 0, 1,
-0.8326123, -0.4704547, -2.418357, 0.6745098, 1, 0, 1,
-0.8253791, 0.2627973, -1.996213, 0.6666667, 1, 0, 1,
-0.824154, -0.9975061, -1.336804, 0.6627451, 1, 0, 1,
-0.8207846, 1.624178, -0.8553137, 0.654902, 1, 0, 1,
-0.8135046, 0.5913947, -1.970681, 0.6509804, 1, 0, 1,
-0.8134406, 0.6652594, 0.6748534, 0.6431373, 1, 0, 1,
-0.8115483, 1.690059, -2.081223, 0.6392157, 1, 0, 1,
-0.8110041, 0.3219987, -1.696333, 0.6313726, 1, 0, 1,
-0.8109523, -1.310912, -2.312855, 0.627451, 1, 0, 1,
-0.7997838, 0.1173295, -0.4812785, 0.6196079, 1, 0, 1,
-0.7939463, 1.154271, 1.716317, 0.6156863, 1, 0, 1,
-0.7904987, 0.4238068, -0.9499379, 0.6078432, 1, 0, 1,
-0.7894796, 0.3984016, -0.2389922, 0.6039216, 1, 0, 1,
-0.7872778, -1.985188, -1.370268, 0.5960785, 1, 0, 1,
-0.7818495, 1.713804, -2.3431, 0.5882353, 1, 0, 1,
-0.7809513, 0.4032573, 0.0939336, 0.5843138, 1, 0, 1,
-0.7793082, 1.560655, -0.416903, 0.5764706, 1, 0, 1,
-0.7752532, 0.4905884, 0.8904105, 0.572549, 1, 0, 1,
-0.7747145, -0.1672208, -1.504583, 0.5647059, 1, 0, 1,
-0.774114, -0.1978073, -0.7258788, 0.5607843, 1, 0, 1,
-0.7736924, 0.525762, -2.526759, 0.5529412, 1, 0, 1,
-0.7729123, -0.8006702, -2.228471, 0.5490196, 1, 0, 1,
-0.7723303, -0.05136586, -2.063978, 0.5411765, 1, 0, 1,
-0.7692543, 0.6198401, -0.8838934, 0.5372549, 1, 0, 1,
-0.7648208, 0.2907509, -3.422092, 0.5294118, 1, 0, 1,
-0.7643303, -0.2125397, -2.016963, 0.5254902, 1, 0, 1,
-0.7614927, 1.60395, 0.3441299, 0.5176471, 1, 0, 1,
-0.7585402, -2.377215, -2.48351, 0.5137255, 1, 0, 1,
-0.7558567, 0.2719483, -1.013361, 0.5058824, 1, 0, 1,
-0.7536265, -0.8947532, -2.363627, 0.5019608, 1, 0, 1,
-0.75063, 0.03565386, -2.427887, 0.4941176, 1, 0, 1,
-0.7501929, 1.558865, -0.2691533, 0.4862745, 1, 0, 1,
-0.748688, 0.2560182, -0.9981937, 0.4823529, 1, 0, 1,
-0.7437736, -0.2230471, -0.9283139, 0.4745098, 1, 0, 1,
-0.7399281, -1.776122, -2.121637, 0.4705882, 1, 0, 1,
-0.7361534, 0.9342106, -0.6967476, 0.4627451, 1, 0, 1,
-0.7317185, -0.4800628, -1.694292, 0.4588235, 1, 0, 1,
-0.7307385, -1.804537, -2.504042, 0.4509804, 1, 0, 1,
-0.7181739, -0.6632547, -1.274751, 0.4470588, 1, 0, 1,
-0.7084796, 1.971991, 0.1405742, 0.4392157, 1, 0, 1,
-0.7080693, -1.655009, -2.577423, 0.4352941, 1, 0, 1,
-0.7071238, -1.838103, -2.62136, 0.427451, 1, 0, 1,
-0.7021456, -0.2504388, -1.80014, 0.4235294, 1, 0, 1,
-0.7007763, -1.685199, -3.102115, 0.4156863, 1, 0, 1,
-0.6985267, -1.400307, -1.913987, 0.4117647, 1, 0, 1,
-0.6984168, 0.002684146, -0.9194732, 0.4039216, 1, 0, 1,
-0.6964549, 0.0332253, 0.3649898, 0.3960784, 1, 0, 1,
-0.694898, -0.7275315, -2.135056, 0.3921569, 1, 0, 1,
-0.6861424, 0.1756387, -1.805686, 0.3843137, 1, 0, 1,
-0.6835806, 1.13809, 0.4019085, 0.3803922, 1, 0, 1,
-0.673338, -1.726099, -2.620899, 0.372549, 1, 0, 1,
-0.6719822, 0.0451211, -2.09506, 0.3686275, 1, 0, 1,
-0.6644472, -0.02697513, -2.413701, 0.3607843, 1, 0, 1,
-0.6596795, -1.191571, -2.132781, 0.3568628, 1, 0, 1,
-0.6595371, -0.962913, -2.157883, 0.3490196, 1, 0, 1,
-0.6580217, -1.069715, -0.4277619, 0.345098, 1, 0, 1,
-0.6573899, -0.1605411, -2.44229, 0.3372549, 1, 0, 1,
-0.6531457, 0.1294902, -2.672125, 0.3333333, 1, 0, 1,
-0.6504546, 1.871524, 0.08881595, 0.3254902, 1, 0, 1,
-0.6476974, -0.1932004, -1.780149, 0.3215686, 1, 0, 1,
-0.6452418, -0.6573885, -3.625079, 0.3137255, 1, 0, 1,
-0.6406692, -1.049464, -1.441328, 0.3098039, 1, 0, 1,
-0.640352, -0.6632813, -1.543779, 0.3019608, 1, 0, 1,
-0.6381217, 0.4118958, -1.095539, 0.2941177, 1, 0, 1,
-0.6370001, 1.190452, -1.673521, 0.2901961, 1, 0, 1,
-0.63695, -1.743788, -3.186042, 0.282353, 1, 0, 1,
-0.6344207, -1.256387, -2.021064, 0.2784314, 1, 0, 1,
-0.630176, -2.105124, -3.851551, 0.2705882, 1, 0, 1,
-0.6277875, -1.655008, -2.022314, 0.2666667, 1, 0, 1,
-0.6238142, -1.413348, -2.076732, 0.2588235, 1, 0, 1,
-0.6233312, -0.04656412, -3.031721, 0.254902, 1, 0, 1,
-0.6135069, 0.6694607, -0.2603081, 0.2470588, 1, 0, 1,
-0.610754, 1.642302, 0.4472138, 0.2431373, 1, 0, 1,
-0.6090502, -2.416599, -3.951928, 0.2352941, 1, 0, 1,
-0.6077091, -0.4349066, -2.160851, 0.2313726, 1, 0, 1,
-0.6057457, 0.1909983, -0.965909, 0.2235294, 1, 0, 1,
-0.6026912, 0.02119826, -1.025609, 0.2196078, 1, 0, 1,
-0.6012162, -0.9192262, -2.064229, 0.2117647, 1, 0, 1,
-0.5963016, 0.6804699, -0.3853283, 0.2078431, 1, 0, 1,
-0.5935928, -0.6954103, -2.596877, 0.2, 1, 0, 1,
-0.590008, -1.781685, -3.492553, 0.1921569, 1, 0, 1,
-0.5895606, -0.1155064, -1.969159, 0.1882353, 1, 0, 1,
-0.5866592, 0.7678114, -0.0634295, 0.1803922, 1, 0, 1,
-0.5862351, 0.4714452, -2.25974, 0.1764706, 1, 0, 1,
-0.5738686, 0.7449551, 0.2178347, 0.1686275, 1, 0, 1,
-0.5706215, -1.764542, -1.317227, 0.1647059, 1, 0, 1,
-0.5675708, 0.4402946, -1.64316, 0.1568628, 1, 0, 1,
-0.5611372, -1.501608, -3.030246, 0.1529412, 1, 0, 1,
-0.5483484, 0.5836942, -1.022457, 0.145098, 1, 0, 1,
-0.5430062, -1.884033, -2.963345, 0.1411765, 1, 0, 1,
-0.5406417, 0.3492675, -1.245655, 0.1333333, 1, 0, 1,
-0.5318086, 0.6366533, 0.1532074, 0.1294118, 1, 0, 1,
-0.5318031, 0.4941362, 0.394565, 0.1215686, 1, 0, 1,
-0.5233208, -1.393473, -1.584583, 0.1176471, 1, 0, 1,
-0.5161558, 0.04940961, 0.1772965, 0.1098039, 1, 0, 1,
-0.5146262, 0.840567, -1.329518, 0.1058824, 1, 0, 1,
-0.5099997, -0.6896321, -3.038728, 0.09803922, 1, 0, 1,
-0.5083335, -1.148926, -2.663496, 0.09019608, 1, 0, 1,
-0.5074606, -0.7765875, -1.19293, 0.08627451, 1, 0, 1,
-0.507104, 0.2286583, -3.285068, 0.07843138, 1, 0, 1,
-0.5066761, 1.014942, 0.3471765, 0.07450981, 1, 0, 1,
-0.5064619, 0.159305, -1.753992, 0.06666667, 1, 0, 1,
-0.5062254, -0.5826399, -4.146797, 0.0627451, 1, 0, 1,
-0.5041255, -0.4073258, -1.569078, 0.05490196, 1, 0, 1,
-0.5014664, 0.2623283, -0.471741, 0.05098039, 1, 0, 1,
-0.500653, 0.271586, -1.156789, 0.04313726, 1, 0, 1,
-0.5005251, -2.497106, -2.381269, 0.03921569, 1, 0, 1,
-0.497163, -1.78168, -3.117816, 0.03137255, 1, 0, 1,
-0.4913494, -0.6744574, -2.688494, 0.02745098, 1, 0, 1,
-0.4906003, 0.6601947, -0.7894332, 0.01960784, 1, 0, 1,
-0.4878224, -0.4705217, -2.895073, 0.01568628, 1, 0, 1,
-0.4868253, 0.2549967, -1.55622, 0.007843138, 1, 0, 1,
-0.4833211, -0.1936254, -1.159549, 0.003921569, 1, 0, 1,
-0.4779993, 0.7504482, -0.1859154, 0, 1, 0.003921569, 1,
-0.4762284, -1.286307, -2.281792, 0, 1, 0.01176471, 1,
-0.475455, -1.707061, -2.495466, 0, 1, 0.01568628, 1,
-0.471965, -0.1028314, -2.696657, 0, 1, 0.02352941, 1,
-0.4675327, 0.5315747, 1.382436, 0, 1, 0.02745098, 1,
-0.4590146, -0.06749684, -2.454727, 0, 1, 0.03529412, 1,
-0.4531957, 1.10345, -1.473271, 0, 1, 0.03921569, 1,
-0.4438613, 1.169599, -1.227502, 0, 1, 0.04705882, 1,
-0.4435652, 1.40532, 0.4430307, 0, 1, 0.05098039, 1,
-0.4382509, 0.07219268, -1.174103, 0, 1, 0.05882353, 1,
-0.4380078, -1.598166, -2.223636, 0, 1, 0.0627451, 1,
-0.4247921, 0.1474249, -1.943177, 0, 1, 0.07058824, 1,
-0.4230289, -0.9606746, -3.667943, 0, 1, 0.07450981, 1,
-0.4213202, 1.554353, 1.5799, 0, 1, 0.08235294, 1,
-0.4207555, 0.9299576, 1.395633, 0, 1, 0.08627451, 1,
-0.4204333, -1.483477, -2.803504, 0, 1, 0.09411765, 1,
-0.420357, 0.2842387, -0.1099572, 0, 1, 0.1019608, 1,
-0.4182414, -0.5356343, -2.282924, 0, 1, 0.1058824, 1,
-0.4142522, -2.468951, -2.100079, 0, 1, 0.1137255, 1,
-0.4137133, -0.2377053, -1.523637, 0, 1, 0.1176471, 1,
-0.4092804, 0.5294229, -1.608432, 0, 1, 0.1254902, 1,
-0.4057274, -1.349752, -1.838967, 0, 1, 0.1294118, 1,
-0.4032462, -0.5858618, -2.101703, 0, 1, 0.1372549, 1,
-0.3996786, -0.09209319, -1.065121, 0, 1, 0.1411765, 1,
-0.3956447, 0.9090003, 0.01569958, 0, 1, 0.1490196, 1,
-0.3945879, 0.5830118, -2.109222, 0, 1, 0.1529412, 1,
-0.3929115, -2.551108, -1.632795, 0, 1, 0.1607843, 1,
-0.3802485, 1.802517, 1.182252, 0, 1, 0.1647059, 1,
-0.3762196, -0.04175222, -2.645422, 0, 1, 0.172549, 1,
-0.372249, 1.784774, -0.06834726, 0, 1, 0.1764706, 1,
-0.3707798, 1.138834, 0.07479619, 0, 1, 0.1843137, 1,
-0.365531, -0.5328196, -2.937749, 0, 1, 0.1882353, 1,
-0.364741, 0.6022103, -0.2335868, 0, 1, 0.1960784, 1,
-0.3640463, 0.1308881, -0.7923284, 0, 1, 0.2039216, 1,
-0.3578634, 0.005912408, -2.496204, 0, 1, 0.2078431, 1,
-0.3498398, 1.130898, -0.1386171, 0, 1, 0.2156863, 1,
-0.349739, -1.092799, -2.377483, 0, 1, 0.2196078, 1,
-0.3491562, -0.2684124, -2.698353, 0, 1, 0.227451, 1,
-0.3488782, 1.388601, 1.073735, 0, 1, 0.2313726, 1,
-0.34788, 0.3691611, -1.794046, 0, 1, 0.2392157, 1,
-0.342275, -0.3559893, -3.459382, 0, 1, 0.2431373, 1,
-0.3399041, 1.784479, -0.3766055, 0, 1, 0.2509804, 1,
-0.3388226, 0.02782032, -1.465048, 0, 1, 0.254902, 1,
-0.3373718, -1.571775, -1.640828, 0, 1, 0.2627451, 1,
-0.3349488, -0.1662343, -1.909153, 0, 1, 0.2666667, 1,
-0.3347023, -0.8577167, -1.538649, 0, 1, 0.2745098, 1,
-0.3331105, -0.8968359, -2.904366, 0, 1, 0.2784314, 1,
-0.3299382, -1.536288, -3.930115, 0, 1, 0.2862745, 1,
-0.3243208, 1.709808, 0.1060266, 0, 1, 0.2901961, 1,
-0.3232653, -0.5966339, -2.906045, 0, 1, 0.2980392, 1,
-0.322127, -0.2844271, -0.7573794, 0, 1, 0.3058824, 1,
-0.3220913, 1.048353, 0.3390109, 0, 1, 0.3098039, 1,
-0.3089482, -0.961447, -2.873789, 0, 1, 0.3176471, 1,
-0.3067092, 0.5527407, 0.3656398, 0, 1, 0.3215686, 1,
-0.303895, -0.2824181, -1.868491, 0, 1, 0.3294118, 1,
-0.3000901, 0.6651608, 0.4873762, 0, 1, 0.3333333, 1,
-0.2912409, -1.356166, -4.435642, 0, 1, 0.3411765, 1,
-0.2898057, -1.470775, -3.973575, 0, 1, 0.345098, 1,
-0.2867313, -0.005498656, -1.419353, 0, 1, 0.3529412, 1,
-0.2820202, 2.04668, -0.4172158, 0, 1, 0.3568628, 1,
-0.2813974, 2.407049, -0.6837136, 0, 1, 0.3647059, 1,
-0.2760985, -0.8485172, -3.395708, 0, 1, 0.3686275, 1,
-0.2639416, 0.6837006, 0.05439172, 0, 1, 0.3764706, 1,
-0.2613607, -1.250593, -0.8881102, 0, 1, 0.3803922, 1,
-0.2607501, -0.2426905, -0.2569898, 0, 1, 0.3882353, 1,
-0.2606215, 0.6753651, 0.9550472, 0, 1, 0.3921569, 1,
-0.257118, -0.3184014, -3.877801, 0, 1, 0.4, 1,
-0.2569123, -1.230249, -2.347407, 0, 1, 0.4078431, 1,
-0.2566707, 0.3163354, -1.930201, 0, 1, 0.4117647, 1,
-0.2549277, -1.114481, -3.730154, 0, 1, 0.4196078, 1,
-0.2492858, -0.3303078, -3.397154, 0, 1, 0.4235294, 1,
-0.2455314, 0.1942178, -1.577382, 0, 1, 0.4313726, 1,
-0.2439923, -0.8806084, -3.371293, 0, 1, 0.4352941, 1,
-0.2427453, 0.7511517, -0.5335601, 0, 1, 0.4431373, 1,
-0.2349353, -0.4626894, -2.498828, 0, 1, 0.4470588, 1,
-0.232502, -0.9839504, -3.376381, 0, 1, 0.454902, 1,
-0.2316928, 1.567609, 0.2522325, 0, 1, 0.4588235, 1,
-0.2224376, -0.4519657, -3.214617, 0, 1, 0.4666667, 1,
-0.2157163, 0.4253317, 0.3561093, 0, 1, 0.4705882, 1,
-0.210552, 1.448817, -1.901794, 0, 1, 0.4784314, 1,
-0.2094803, 1.657058, 0.2889625, 0, 1, 0.4823529, 1,
-0.2072551, -0.7174285, -1.590479, 0, 1, 0.4901961, 1,
-0.1997716, -1.676195, -1.210826, 0, 1, 0.4941176, 1,
-0.1983315, -0.7676263, -2.02874, 0, 1, 0.5019608, 1,
-0.1925826, 1.207077, -1.494786, 0, 1, 0.509804, 1,
-0.1922094, -0.6797837, -3.213004, 0, 1, 0.5137255, 1,
-0.1871078, -0.1570291, -1.54984, 0, 1, 0.5215687, 1,
-0.1862253, 1.141417, -0.4596676, 0, 1, 0.5254902, 1,
-0.1793397, -0.8113433, -2.093828, 0, 1, 0.5333334, 1,
-0.1745572, -0.8641837, -3.563361, 0, 1, 0.5372549, 1,
-0.1742753, 1.04776, -0.5520759, 0, 1, 0.5450981, 1,
-0.1725907, -0.7325314, -2.190346, 0, 1, 0.5490196, 1,
-0.1715548, 1.421346, -2.714914, 0, 1, 0.5568628, 1,
-0.1705157, -0.9698074, -3.356747, 0, 1, 0.5607843, 1,
-0.1686426, 0.7751691, -0.6294939, 0, 1, 0.5686275, 1,
-0.1663661, 0.3984209, -2.504645, 0, 1, 0.572549, 1,
-0.1651293, -1.418943, -2.272122, 0, 1, 0.5803922, 1,
-0.1650859, 2.025666, 1.080295, 0, 1, 0.5843138, 1,
-0.1640722, -0.9403606, -2.16097, 0, 1, 0.5921569, 1,
-0.1579759, 0.005031576, -2.770432, 0, 1, 0.5960785, 1,
-0.1574069, -0.301939, -2.416807, 0, 1, 0.6039216, 1,
-0.1572426, 0.9673395, -0.4894647, 0, 1, 0.6117647, 1,
-0.154978, -0.5425794, -1.861159, 0, 1, 0.6156863, 1,
-0.1546738, -0.03845018, -3.48, 0, 1, 0.6235294, 1,
-0.153046, 1.370097, 0.3135237, 0, 1, 0.627451, 1,
-0.149571, 0.2542107, -1.051677, 0, 1, 0.6352941, 1,
-0.1383861, -0.1789295, -5.169824, 0, 1, 0.6392157, 1,
-0.1264179, -0.930205, -1.49494, 0, 1, 0.6470588, 1,
-0.1255382, -2.574451, -2.681163, 0, 1, 0.6509804, 1,
-0.1247912, -0.9141905, -2.896816, 0, 1, 0.6588235, 1,
-0.1233448, -0.1254762, -2.584949, 0, 1, 0.6627451, 1,
-0.1233223, -1.155613, -1.877302, 0, 1, 0.6705883, 1,
-0.1150865, -1.266937, -3.51197, 0, 1, 0.6745098, 1,
-0.1130356, 0.2678452, 0.3544632, 0, 1, 0.682353, 1,
-0.1123414, 0.9090926, -0.5419961, 0, 1, 0.6862745, 1,
-0.1121826, -0.08399341, 0.03640032, 0, 1, 0.6941177, 1,
-0.1091813, 2.666396, 0.3389541, 0, 1, 0.7019608, 1,
-0.1090832, -0.3206524, -3.781172, 0, 1, 0.7058824, 1,
-0.1073087, -0.215859, -2.271015, 0, 1, 0.7137255, 1,
-0.1041479, -0.3653273, -1.729583, 0, 1, 0.7176471, 1,
-0.103589, -0.1423958, -2.997842, 0, 1, 0.7254902, 1,
-0.1017116, 0.03292776, -1.294956, 0, 1, 0.7294118, 1,
-0.1007515, 0.6702665, -2.089938, 0, 1, 0.7372549, 1,
-0.0997505, 1.794595, -1.257182, 0, 1, 0.7411765, 1,
-0.09453033, -0.6442197, -1.52326, 0, 1, 0.7490196, 1,
-0.09033591, -1.195257, -3.421462, 0, 1, 0.7529412, 1,
-0.08993382, -0.3723324, -2.372701, 0, 1, 0.7607843, 1,
-0.08617362, 2.824749, -1.066042, 0, 1, 0.7647059, 1,
-0.07903709, 0.01061851, -0.8429896, 0, 1, 0.772549, 1,
-0.0785743, 0.8674855, -0.4614, 0, 1, 0.7764706, 1,
-0.07554788, -0.1640122, -2.540009, 0, 1, 0.7843137, 1,
-0.07285964, 0.8726574, -1.413169, 0, 1, 0.7882353, 1,
-0.07262908, -0.751681, -2.335417, 0, 1, 0.7960784, 1,
-0.07036918, 0.01528139, -4.229481, 0, 1, 0.8039216, 1,
-0.0688251, 0.008293507, -1.093104, 0, 1, 0.8078431, 1,
-0.06238782, -0.4629734, -4.044695, 0, 1, 0.8156863, 1,
-0.05965441, -1.6806, -2.71573, 0, 1, 0.8196079, 1,
-0.05894363, 0.7647674, -0.1030078, 0, 1, 0.827451, 1,
-0.05832799, -2.023627, -3.594711, 0, 1, 0.8313726, 1,
-0.05646218, -0.4870561, -4.613968, 0, 1, 0.8392157, 1,
-0.05373564, -0.5302657, -3.929185, 0, 1, 0.8431373, 1,
-0.05023272, 0.9484502, -0.6527329, 0, 1, 0.8509804, 1,
-0.04996019, 0.5907733, 0.3282812, 0, 1, 0.854902, 1,
-0.04807879, -0.829572, -2.155016, 0, 1, 0.8627451, 1,
-0.04804641, -0.9799606, -3.701239, 0, 1, 0.8666667, 1,
-0.04804542, 0.6961137, 1.135925, 0, 1, 0.8745098, 1,
-0.04491789, -1.308166, -5.375267, 0, 1, 0.8784314, 1,
-0.0398689, 0.2117466, 1.863959, 0, 1, 0.8862745, 1,
-0.03543189, 1.302443, 0.6732648, 0, 1, 0.8901961, 1,
-0.03487185, -1.100348, -3.099975, 0, 1, 0.8980392, 1,
-0.03386493, -1.193374, -4.03384, 0, 1, 0.9058824, 1,
-0.03217876, -1.636653, -2.732911, 0, 1, 0.9098039, 1,
-0.03119787, -3.121381, -0.8605225, 0, 1, 0.9176471, 1,
-0.02767196, 0.5602722, -0.05974323, 0, 1, 0.9215686, 1,
-0.02322363, -1.487066, -3.348434, 0, 1, 0.9294118, 1,
-0.02002774, -2.073107, -3.542562, 0, 1, 0.9333333, 1,
-0.01610086, -0.1915041, -1.727672, 0, 1, 0.9411765, 1,
-0.01579492, 0.7080659, -0.2841493, 0, 1, 0.945098, 1,
-0.01414122, -1.032593, -1.255101, 0, 1, 0.9529412, 1,
-0.01242695, 1.866637, 0.4157212, 0, 1, 0.9568627, 1,
-0.0113654, 1.136583, -0.20946, 0, 1, 0.9647059, 1,
-0.01074224, -0.05371654, -2.257677, 0, 1, 0.9686275, 1,
-0.01070283, -0.6340199, -5.170703, 0, 1, 0.9764706, 1,
-0.007519537, -0.4576754, -4.010492, 0, 1, 0.9803922, 1,
-0.002375981, -0.6807987, -3.645577, 0, 1, 0.9882353, 1,
-0.002097191, -0.5216452, -1.737794, 0, 1, 0.9921569, 1,
-0.001234432, -0.6773429, -3.657803, 0, 1, 1, 1,
0.001865156, 1.210385, 0.9541338, 0, 0.9921569, 1, 1,
0.005026029, -1.21577, 4.033328, 0, 0.9882353, 1, 1,
0.005232988, 0.4889868, -0.6121699, 0, 0.9803922, 1, 1,
0.006365114, 0.1978867, 0.5762693, 0, 0.9764706, 1, 1,
0.007096404, 0.2721922, -2.467835, 0, 0.9686275, 1, 1,
0.007373916, -1.214513, 2.651317, 0, 0.9647059, 1, 1,
0.007404876, 0.4840644, 0.5321208, 0, 0.9568627, 1, 1,
0.008199852, -1.156697, 1.610069, 0, 0.9529412, 1, 1,
0.008929163, -1.019935, 3.690152, 0, 0.945098, 1, 1,
0.01866643, -1.114266, 4.921369, 0, 0.9411765, 1, 1,
0.02100893, 1.370623, 0.8463818, 0, 0.9333333, 1, 1,
0.02174484, -1.326984, 3.721012, 0, 0.9294118, 1, 1,
0.02957959, 0.1824408, -1.093654, 0, 0.9215686, 1, 1,
0.03003546, 0.6309879, 0.2615071, 0, 0.9176471, 1, 1,
0.03390492, -0.6429948, 4.407637, 0, 0.9098039, 1, 1,
0.03580105, -0.6621999, 1.787721, 0, 0.9058824, 1, 1,
0.03582681, -1.385505, 2.166505, 0, 0.8980392, 1, 1,
0.03801544, 0.3855534, 1.225741, 0, 0.8901961, 1, 1,
0.04136619, -0.07302856, 4.068539, 0, 0.8862745, 1, 1,
0.04273891, -0.6821265, 3.511221, 0, 0.8784314, 1, 1,
0.04717885, -0.8202429, 3.262751, 0, 0.8745098, 1, 1,
0.05079927, 0.008067549, 0.6503181, 0, 0.8666667, 1, 1,
0.05559537, 0.2853477, 0.3604676, 0, 0.8627451, 1, 1,
0.06200419, 0.4678617, 0.3566224, 0, 0.854902, 1, 1,
0.06289386, -0.4883776, 1.932602, 0, 0.8509804, 1, 1,
0.06392805, 0.7800167, 1.018339, 0, 0.8431373, 1, 1,
0.07089954, 0.902379, -1.685251, 0, 0.8392157, 1, 1,
0.07130004, 2.022674, -0.07923092, 0, 0.8313726, 1, 1,
0.07928107, 0.1160946, 0.06975532, 0, 0.827451, 1, 1,
0.07940328, 1.022261, 0.2671143, 0, 0.8196079, 1, 1,
0.08517907, -0.4110088, 3.531809, 0, 0.8156863, 1, 1,
0.08750645, 0.6203492, 2.091921, 0, 0.8078431, 1, 1,
0.08843321, 0.1868603, -2.142724, 0, 0.8039216, 1, 1,
0.08959498, 0.927424, -1.017925, 0, 0.7960784, 1, 1,
0.09191197, -0.2513234, 2.515301, 0, 0.7882353, 1, 1,
0.09451241, -1.436228, 2.022732, 0, 0.7843137, 1, 1,
0.09464062, -0.3682214, 3.265404, 0, 0.7764706, 1, 1,
0.09510063, 1.30156, -1.0331, 0, 0.772549, 1, 1,
0.09845049, 2.33773, 0.5235979, 0, 0.7647059, 1, 1,
0.09879768, -1.387584, 3.428087, 0, 0.7607843, 1, 1,
0.1057343, -0.112964, 2.061617, 0, 0.7529412, 1, 1,
0.106325, 2.071464, -0.2943277, 0, 0.7490196, 1, 1,
0.1067251, -0.8917071, 3.32486, 0, 0.7411765, 1, 1,
0.1109336, -0.8977432, 2.201972, 0, 0.7372549, 1, 1,
0.1124475, -0.06888318, 1.318556, 0, 0.7294118, 1, 1,
0.1135087, -1.155685, 4.017729, 0, 0.7254902, 1, 1,
0.1145254, 0.8008621, -0.1353416, 0, 0.7176471, 1, 1,
0.1215609, 0.1017379, 1.52074, 0, 0.7137255, 1, 1,
0.1221671, 0.7093194, -1.862109, 0, 0.7058824, 1, 1,
0.1223476, 0.5767893, 0.1419614, 0, 0.6980392, 1, 1,
0.125373, -0.7986423, 2.831421, 0, 0.6941177, 1, 1,
0.1276142, -1.126192, 2.389131, 0, 0.6862745, 1, 1,
0.1292805, -0.13175, 1.988146, 0, 0.682353, 1, 1,
0.1295972, -0.9958149, 3.142792, 0, 0.6745098, 1, 1,
0.1304473, -0.739931, 3.155329, 0, 0.6705883, 1, 1,
0.1365107, 0.9060525, 0.2193586, 0, 0.6627451, 1, 1,
0.1376827, -0.9524177, 3.968993, 0, 0.6588235, 1, 1,
0.1417582, -1.047738, 3.849106, 0, 0.6509804, 1, 1,
0.1427912, 0.2417417, 1.945357, 0, 0.6470588, 1, 1,
0.1442718, 0.941685, -1.351599, 0, 0.6392157, 1, 1,
0.1518293, -0.2375225, 1.986605, 0, 0.6352941, 1, 1,
0.1523398, 0.2072807, 1.339652, 0, 0.627451, 1, 1,
0.152516, -1.333809, 3.978724, 0, 0.6235294, 1, 1,
0.1595427, 0.817877, 1.051498, 0, 0.6156863, 1, 1,
0.1621329, 1.469501, 1.073638, 0, 0.6117647, 1, 1,
0.1657772, -0.9371325, 1.448647, 0, 0.6039216, 1, 1,
0.166709, 1.261957, 0.3972445, 0, 0.5960785, 1, 1,
0.1699591, 1.880628, -0.4994539, 0, 0.5921569, 1, 1,
0.1714349, 1.391049, 0.546755, 0, 0.5843138, 1, 1,
0.1858264, 1.91917, -0.951825, 0, 0.5803922, 1, 1,
0.1876894, -0.1091169, 0.1105588, 0, 0.572549, 1, 1,
0.1900699, -0.572098, 3.072197, 0, 0.5686275, 1, 1,
0.1928078, -0.3065882, 4.088731, 0, 0.5607843, 1, 1,
0.1972956, -0.7588698, 4.588402, 0, 0.5568628, 1, 1,
0.2013341, -0.2651311, 2.551228, 0, 0.5490196, 1, 1,
0.2032617, -0.3446485, 2.77773, 0, 0.5450981, 1, 1,
0.2053758, 0.8949474, 0.2000435, 0, 0.5372549, 1, 1,
0.2103786, 0.6580501, 0.09302579, 0, 0.5333334, 1, 1,
0.2114242, 0.8179332, 2.127022, 0, 0.5254902, 1, 1,
0.2116277, -0.8905038, 3.735598, 0, 0.5215687, 1, 1,
0.2124817, -1.37078, 4.379562, 0, 0.5137255, 1, 1,
0.2187925, 0.160403, 0.3104323, 0, 0.509804, 1, 1,
0.2306496, -0.235457, 1.772865, 0, 0.5019608, 1, 1,
0.2338364, 1.106251, 2.18542, 0, 0.4941176, 1, 1,
0.2345169, -0.4595326, 1.935396, 0, 0.4901961, 1, 1,
0.2350062, 0.04364777, 1.202134, 0, 0.4823529, 1, 1,
0.2380319, -0.5640696, 3.189437, 0, 0.4784314, 1, 1,
0.2398306, 0.3665249, -0.2374566, 0, 0.4705882, 1, 1,
0.2403137, -0.7519798, 2.44024, 0, 0.4666667, 1, 1,
0.2419377, -0.3468653, 1.773879, 0, 0.4588235, 1, 1,
0.2425814, -0.009497896, 0.0783048, 0, 0.454902, 1, 1,
0.2435673, -1.29125, 4.086347, 0, 0.4470588, 1, 1,
0.2490415, 0.06873452, 0.2512408, 0, 0.4431373, 1, 1,
0.2539987, 0.2402535, 1.058565, 0, 0.4352941, 1, 1,
0.2557876, -1.318192, 2.556504, 0, 0.4313726, 1, 1,
0.2587116, -1.250039, 1.617703, 0, 0.4235294, 1, 1,
0.2665296, -0.2677708, 2.142247, 0, 0.4196078, 1, 1,
0.2681592, -0.141699, 2.315524, 0, 0.4117647, 1, 1,
0.2712956, 0.6152419, 0.05899369, 0, 0.4078431, 1, 1,
0.2721882, 1.086085, 1.02491, 0, 0.4, 1, 1,
0.2786846, 0.6334666, -1.057581, 0, 0.3921569, 1, 1,
0.2813918, 1.128821, 0.404731, 0, 0.3882353, 1, 1,
0.2968954, -1.137363, 3.741806, 0, 0.3803922, 1, 1,
0.3041219, -1.305499, 5.176227, 0, 0.3764706, 1, 1,
0.3057046, 0.06283058, 2.36638, 0, 0.3686275, 1, 1,
0.3085528, -1.243212, 3.200153, 0, 0.3647059, 1, 1,
0.3104687, 1.315754, -0.6321229, 0, 0.3568628, 1, 1,
0.3135651, 0.4269721, 1.336956, 0, 0.3529412, 1, 1,
0.3176625, 0.1456313, 2.006341, 0, 0.345098, 1, 1,
0.3235191, -1.587356, 2.993278, 0, 0.3411765, 1, 1,
0.3243355, 1.105789, 0.3801956, 0, 0.3333333, 1, 1,
0.3251283, -0.4688807, 2.76624, 0, 0.3294118, 1, 1,
0.3264186, 1.007034, -0.9738837, 0, 0.3215686, 1, 1,
0.3279072, 1.109344, -1.056895, 0, 0.3176471, 1, 1,
0.3281092, 0.7619749, 1.239088, 0, 0.3098039, 1, 1,
0.3310895, 0.3959589, 1.830504, 0, 0.3058824, 1, 1,
0.3311149, -0.4432864, 3.593498, 0, 0.2980392, 1, 1,
0.3341584, 1.066413, 1.239431, 0, 0.2901961, 1, 1,
0.3346243, -0.8434584, 4.680781, 0, 0.2862745, 1, 1,
0.3365335, 1.416721, -0.3446497, 0, 0.2784314, 1, 1,
0.3380133, 0.9135041, 1.681784, 0, 0.2745098, 1, 1,
0.3388997, 0.4199566, -0.8760874, 0, 0.2666667, 1, 1,
0.3443139, -0.9517711, 2.67112, 0, 0.2627451, 1, 1,
0.3497791, 0.4696906, -1.446456, 0, 0.254902, 1, 1,
0.3503642, 0.2973256, 1.676647, 0, 0.2509804, 1, 1,
0.3517487, 0.9093786, 1.924447, 0, 0.2431373, 1, 1,
0.3538734, -0.9916169, 1.107326, 0, 0.2392157, 1, 1,
0.3561648, 0.02179164, 1.657143, 0, 0.2313726, 1, 1,
0.3564953, 0.03073961, 0.8099174, 0, 0.227451, 1, 1,
0.3599499, 0.1349419, 2.324196, 0, 0.2196078, 1, 1,
0.3607303, 1.177561, 0.7681484, 0, 0.2156863, 1, 1,
0.3609081, -0.8849391, 2.361393, 0, 0.2078431, 1, 1,
0.3610058, 0.01572308, 1.494628, 0, 0.2039216, 1, 1,
0.3625319, 0.8562361, 0.8802508, 0, 0.1960784, 1, 1,
0.3628783, -1.269408, 3.715073, 0, 0.1882353, 1, 1,
0.3634408, 0.305741, -0.3536447, 0, 0.1843137, 1, 1,
0.365144, -1.305717, 3.255783, 0, 0.1764706, 1, 1,
0.3672144, 0.9174911, 0.6112785, 0, 0.172549, 1, 1,
0.3774331, 0.9429883, 0.4864542, 0, 0.1647059, 1, 1,
0.3787721, -0.3583457, 3.730362, 0, 0.1607843, 1, 1,
0.3798288, 0.7692952, 1.698584, 0, 0.1529412, 1, 1,
0.3858952, 1.406946, -0.03365583, 0, 0.1490196, 1, 1,
0.3932029, 0.7244774, -0.195836, 0, 0.1411765, 1, 1,
0.3980452, -0.3492621, 2.442524, 0, 0.1372549, 1, 1,
0.3989803, -0.01873918, 1.759424, 0, 0.1294118, 1, 1,
0.3991302, -1.450922, 3.238993, 0, 0.1254902, 1, 1,
0.3995163, -1.53261, 2.981541, 0, 0.1176471, 1, 1,
0.4020499, -0.1477662, 3.568081, 0, 0.1137255, 1, 1,
0.4024455, -0.1033053, 1.349303, 0, 0.1058824, 1, 1,
0.4027949, -1.181234, 2.58417, 0, 0.09803922, 1, 1,
0.4028592, 0.7730541, 1.093865, 0, 0.09411765, 1, 1,
0.4031947, 1.924339, 0.1158859, 0, 0.08627451, 1, 1,
0.4046692, 1.986736, 1.444992, 0, 0.08235294, 1, 1,
0.4046874, 0.1227223, 3.75228, 0, 0.07450981, 1, 1,
0.4067816, 0.5407751, 2.279959, 0, 0.07058824, 1, 1,
0.4069761, 1.162549, 1.053832, 0, 0.0627451, 1, 1,
0.4078946, -1.771711, 4.619395, 0, 0.05882353, 1, 1,
0.4136569, -1.273098, 2.988155, 0, 0.05098039, 1, 1,
0.4148547, 2.322347, -0.4410116, 0, 0.04705882, 1, 1,
0.4150208, -0.5033953, 1.481281, 0, 0.03921569, 1, 1,
0.4166448, 3.068496, 0.2267783, 0, 0.03529412, 1, 1,
0.4178917, 0.9441432, -0.01351056, 0, 0.02745098, 1, 1,
0.4181076, 0.641522, 2.159511, 0, 0.02352941, 1, 1,
0.4181108, -0.2765309, 3.446364, 0, 0.01568628, 1, 1,
0.418501, -0.7221701, 1.267962, 0, 0.01176471, 1, 1,
0.4212291, 1.032344, 1.210063, 0, 0.003921569, 1, 1,
0.4212624, -0.7028276, 2.93681, 0.003921569, 0, 1, 1,
0.4213108, 0.3457254, 1.919427, 0.007843138, 0, 1, 1,
0.424767, -1.495321, 2.56092, 0.01568628, 0, 1, 1,
0.4276359, -0.9793158, 4.175107, 0.01960784, 0, 1, 1,
0.4277253, 0.07618356, 1.709245, 0.02745098, 0, 1, 1,
0.4281021, 0.9287241, -0.2131999, 0.03137255, 0, 1, 1,
0.4298179, 0.3651527, 0.3860925, 0.03921569, 0, 1, 1,
0.4314592, -1.013128, 2.361709, 0.04313726, 0, 1, 1,
0.4328912, 2.040975, 2.307163, 0.05098039, 0, 1, 1,
0.4360133, -0.1135931, 1.122959, 0.05490196, 0, 1, 1,
0.4367713, 0.1452168, 2.455822, 0.0627451, 0, 1, 1,
0.4404368, 1.80455, 1.387187, 0.06666667, 0, 1, 1,
0.4473085, 0.00254411, 1.422866, 0.07450981, 0, 1, 1,
0.451003, 0.03187114, 0.3119985, 0.07843138, 0, 1, 1,
0.4513717, 0.135381, 1.454889, 0.08627451, 0, 1, 1,
0.4561581, -1.601282, 3.26609, 0.09019608, 0, 1, 1,
0.4570781, 0.600367, 0.2141272, 0.09803922, 0, 1, 1,
0.4676509, 0.06719665, 3.135369, 0.1058824, 0, 1, 1,
0.4690655, 0.56337, 0.7656224, 0.1098039, 0, 1, 1,
0.4738472, -1.483432, 2.008965, 0.1176471, 0, 1, 1,
0.4744348, 0.7274917, 0.3188803, 0.1215686, 0, 1, 1,
0.4746077, 1.77834, -0.2099379, 0.1294118, 0, 1, 1,
0.475067, 1.182506, 0.04753187, 0.1333333, 0, 1, 1,
0.4752838, -2.052534, 3.587586, 0.1411765, 0, 1, 1,
0.476141, -0.1922564, 3.383149, 0.145098, 0, 1, 1,
0.4785382, -0.8006941, 3.752274, 0.1529412, 0, 1, 1,
0.4807611, 0.8424037, 0.6207512, 0.1568628, 0, 1, 1,
0.4850342, 1.436986, -0.3413768, 0.1647059, 0, 1, 1,
0.4890073, -1.685071, 3.132156, 0.1686275, 0, 1, 1,
0.489915, -0.1266591, 2.409374, 0.1764706, 0, 1, 1,
0.4932779, -0.2727578, 2.354553, 0.1803922, 0, 1, 1,
0.5003186, -0.7455437, 1.37389, 0.1882353, 0, 1, 1,
0.500452, 0.3122617, 1.024145, 0.1921569, 0, 1, 1,
0.5064337, 0.9399209, 1.046655, 0.2, 0, 1, 1,
0.5073233, 0.7422301, -0.2165346, 0.2078431, 0, 1, 1,
0.5092002, -0.8649664, 1.947157, 0.2117647, 0, 1, 1,
0.5108534, -0.1365102, 1.160509, 0.2196078, 0, 1, 1,
0.511823, 0.1503987, 2.106548, 0.2235294, 0, 1, 1,
0.5132352, -0.1901839, 2.1805, 0.2313726, 0, 1, 1,
0.5141534, 0.8663083, 0.2715086, 0.2352941, 0, 1, 1,
0.51547, -1.320705, 3.66904, 0.2431373, 0, 1, 1,
0.5258183, 1.16985, 0.02501441, 0.2470588, 0, 1, 1,
0.5268812, -1.161643, 3.496231, 0.254902, 0, 1, 1,
0.5287054, 0.7698918, 0.857272, 0.2588235, 0, 1, 1,
0.5336939, 0.278864, 0.394644, 0.2666667, 0, 1, 1,
0.5356189, 0.1834299, 1.013771, 0.2705882, 0, 1, 1,
0.5368791, 0.3880309, -0.6706901, 0.2784314, 0, 1, 1,
0.5382532, 1.062668, 1.238325, 0.282353, 0, 1, 1,
0.5386387, 0.3186614, -0.4249896, 0.2901961, 0, 1, 1,
0.5399505, -0.3957635, 3.855554, 0.2941177, 0, 1, 1,
0.5463731, -0.9870215, 1.492174, 0.3019608, 0, 1, 1,
0.5463948, -0.686177, 1.173319, 0.3098039, 0, 1, 1,
0.550589, 0.416791, 0.9416499, 0.3137255, 0, 1, 1,
0.5598059, 0.05496345, 1.164119, 0.3215686, 0, 1, 1,
0.5600484, 0.9387855, 0.3331329, 0.3254902, 0, 1, 1,
0.5607815, 0.03668211, 1.74049, 0.3333333, 0, 1, 1,
0.5609113, 1.343232, -0.05791904, 0.3372549, 0, 1, 1,
0.5626654, 0.2958493, 0.9413887, 0.345098, 0, 1, 1,
0.5645186, 0.816161, 2.830618, 0.3490196, 0, 1, 1,
0.5706099, 0.7096549, 0.1554145, 0.3568628, 0, 1, 1,
0.570975, 1.508906, 0.4127494, 0.3607843, 0, 1, 1,
0.5731177, -0.710703, 2.264167, 0.3686275, 0, 1, 1,
0.5741322, 1.069824, 0.4064791, 0.372549, 0, 1, 1,
0.5762642, 0.5609773, 1.084213, 0.3803922, 0, 1, 1,
0.576977, -0.1372989, 2.014794, 0.3843137, 0, 1, 1,
0.5799373, -0.09681418, 1.316756, 0.3921569, 0, 1, 1,
0.5803231, 0.3015062, 0.4901206, 0.3960784, 0, 1, 1,
0.5952585, 1.58726, 0.4232799, 0.4039216, 0, 1, 1,
0.5953977, 1.982989, -0.2217645, 0.4117647, 0, 1, 1,
0.5997623, -1.447675, 2.557322, 0.4156863, 0, 1, 1,
0.5998092, -0.3021246, 3.636894, 0.4235294, 0, 1, 1,
0.6102327, 0.009101743, 1.114304, 0.427451, 0, 1, 1,
0.6130357, 0.3709527, 1.600094, 0.4352941, 0, 1, 1,
0.6148657, 0.1277087, 2.563644, 0.4392157, 0, 1, 1,
0.6157416, -0.1487424, 2.257678, 0.4470588, 0, 1, 1,
0.6185734, 1.910979, -0.2543882, 0.4509804, 0, 1, 1,
0.6202016, -0.7862339, 1.976446, 0.4588235, 0, 1, 1,
0.6247266, 0.5014516, -0.843163, 0.4627451, 0, 1, 1,
0.6273699, 0.3332892, 0.5536823, 0.4705882, 0, 1, 1,
0.6303672, -0.1646277, 1.377714, 0.4745098, 0, 1, 1,
0.6358178, -0.4474534, 2.94524, 0.4823529, 0, 1, 1,
0.6405733, -0.6764465, 2.049703, 0.4862745, 0, 1, 1,
0.6488794, -0.6322387, 2.881253, 0.4941176, 0, 1, 1,
0.6518517, -1.5863, 3.329237, 0.5019608, 0, 1, 1,
0.6527697, -0.2386391, 2.771047, 0.5058824, 0, 1, 1,
0.6531484, -0.1367827, 2.235002, 0.5137255, 0, 1, 1,
0.6540179, 0.6473077, 0.8277466, 0.5176471, 0, 1, 1,
0.6574283, -0.756124, 2.65919, 0.5254902, 0, 1, 1,
0.6576832, 0.9537452, -0.4622909, 0.5294118, 0, 1, 1,
0.6604778, -1.057646, 3.249252, 0.5372549, 0, 1, 1,
0.6611209, 0.4471664, 1.03173, 0.5411765, 0, 1, 1,
0.6614494, 0.4610462, 1.025544, 0.5490196, 0, 1, 1,
0.6639577, 1.085994, -0.08390907, 0.5529412, 0, 1, 1,
0.6652256, 0.1575971, 1.225651, 0.5607843, 0, 1, 1,
0.6667339, 1.478811, 1.487016, 0.5647059, 0, 1, 1,
0.6701152, 1.344359, 1.374445, 0.572549, 0, 1, 1,
0.6705515, -1.073005, 1.777815, 0.5764706, 0, 1, 1,
0.6738379, -0.04102397, 2.953991, 0.5843138, 0, 1, 1,
0.6751837, 0.4971385, -0.08856937, 0.5882353, 0, 1, 1,
0.6796514, -0.5014134, 1.325492, 0.5960785, 0, 1, 1,
0.684055, -0.6631142, 2.521963, 0.6039216, 0, 1, 1,
0.6847873, 0.2932659, 2.364936, 0.6078432, 0, 1, 1,
0.6888276, 0.9279706, 1.823037, 0.6156863, 0, 1, 1,
0.6983528, -0.6269714, 2.687623, 0.6196079, 0, 1, 1,
0.6985672, -0.6909423, 0.5610359, 0.627451, 0, 1, 1,
0.7117602, -1.226778, 3.579163, 0.6313726, 0, 1, 1,
0.7150453, -0.416601, 1.987278, 0.6392157, 0, 1, 1,
0.7155316, 1.666632, 0.6462845, 0.6431373, 0, 1, 1,
0.7295727, 1.497288, 1.076145, 0.6509804, 0, 1, 1,
0.7302803, 0.5493065, 3.422704, 0.654902, 0, 1, 1,
0.7314243, 0.08153411, 1.723451, 0.6627451, 0, 1, 1,
0.7404206, 1.280809, 0.384477, 0.6666667, 0, 1, 1,
0.7441933, -1.221185, 1.857276, 0.6745098, 0, 1, 1,
0.7450014, -0.9119583, 3.113245, 0.6784314, 0, 1, 1,
0.7470078, -0.788179, 2.614702, 0.6862745, 0, 1, 1,
0.7479388, 0.5127507, 0.7245668, 0.6901961, 0, 1, 1,
0.7501076, 0.972801, 2.434281, 0.6980392, 0, 1, 1,
0.7578831, 0.4131674, -0.7189469, 0.7058824, 0, 1, 1,
0.7580285, -0.3528811, 0.6679956, 0.7098039, 0, 1, 1,
0.7595178, -1.098597, 3.27299, 0.7176471, 0, 1, 1,
0.7648028, 0.6474089, 1.285296, 0.7215686, 0, 1, 1,
0.7661285, 0.1243489, 1.959499, 0.7294118, 0, 1, 1,
0.7661777, -0.1759115, 1.952144, 0.7333333, 0, 1, 1,
0.7785774, -1.603464, 1.49252, 0.7411765, 0, 1, 1,
0.7906424, 0.03688824, 1.949654, 0.7450981, 0, 1, 1,
0.7916602, 0.7679383, 0.9008969, 0.7529412, 0, 1, 1,
0.7923786, -0.2290466, 1.312798, 0.7568628, 0, 1, 1,
0.7987869, 0.6078979, 1.259066, 0.7647059, 0, 1, 1,
0.7992725, 0.9269211, 1.214192, 0.7686275, 0, 1, 1,
0.8160166, 1.201229, 0.9990264, 0.7764706, 0, 1, 1,
0.8189211, -0.4768224, 1.632691, 0.7803922, 0, 1, 1,
0.8274614, 0.8016463, -0.5139171, 0.7882353, 0, 1, 1,
0.8277416, 1.22365, 0.9888184, 0.7921569, 0, 1, 1,
0.8283215, 0.02884486, 0.2838107, 0.8, 0, 1, 1,
0.8283714, -0.8774865, 4.169432, 0.8078431, 0, 1, 1,
0.8334307, 1.254231, 2.077374, 0.8117647, 0, 1, 1,
0.8352612, -0.01974448, 0.422484, 0.8196079, 0, 1, 1,
0.8416928, 0.3755651, 1.316623, 0.8235294, 0, 1, 1,
0.8442267, 1.495488, 0.6619028, 0.8313726, 0, 1, 1,
0.8443333, -0.8556785, 3.020879, 0.8352941, 0, 1, 1,
0.8470822, 0.3268246, 0.1591295, 0.8431373, 0, 1, 1,
0.8480652, 1.360049, 0.6138163, 0.8470588, 0, 1, 1,
0.8579058, -0.3143131, 0.0904206, 0.854902, 0, 1, 1,
0.8586017, 0.5157935, 2.39388, 0.8588235, 0, 1, 1,
0.8603505, -0.4291577, 1.968505, 0.8666667, 0, 1, 1,
0.86203, 1.05482, -0.123119, 0.8705882, 0, 1, 1,
0.8757834, -1.321809, 1.831902, 0.8784314, 0, 1, 1,
0.8772129, -1.047916, 3.687047, 0.8823529, 0, 1, 1,
0.8856182, -2.446295, 2.684578, 0.8901961, 0, 1, 1,
0.8907174, -0.4800351, 1.390594, 0.8941177, 0, 1, 1,
0.8928877, -0.01011581, 1.16383, 0.9019608, 0, 1, 1,
0.8947908, -0.3860297, 3.272437, 0.9098039, 0, 1, 1,
0.8952565, -0.6690594, 2.616489, 0.9137255, 0, 1, 1,
0.8968937, 2.139072, 0.5730377, 0.9215686, 0, 1, 1,
0.8973225, -0.5969033, 2.159726, 0.9254902, 0, 1, 1,
0.8994513, -0.3041338, 1.48463, 0.9333333, 0, 1, 1,
0.9000171, 1.111292, 1.112387, 0.9372549, 0, 1, 1,
0.9004274, 0.685748, 0.7069028, 0.945098, 0, 1, 1,
0.9023896, -1.671299, 2.664534, 0.9490196, 0, 1, 1,
0.9063764, -0.1260305, 1.636605, 0.9568627, 0, 1, 1,
0.9078583, 0.4811555, 1.861047, 0.9607843, 0, 1, 1,
0.9223803, 0.06350347, 0.772723, 0.9686275, 0, 1, 1,
0.9226379, -0.9356819, 2.027283, 0.972549, 0, 1, 1,
0.9305935, 0.5873884, 1.938127, 0.9803922, 0, 1, 1,
0.9343358, 1.812413, 0.7549663, 0.9843137, 0, 1, 1,
0.9353532, -0.08011921, 2.73518, 0.9921569, 0, 1, 1,
0.9404182, -0.8422737, 2.20304, 0.9960784, 0, 1, 1,
0.9445742, 0.4409318, 2.749555, 1, 0, 0.9960784, 1,
0.9527749, 0.666312, 1.24554, 1, 0, 0.9882353, 1,
0.9624664, 0.8592011, 0.2436582, 1, 0, 0.9843137, 1,
0.9689024, 1.076268, 1.044105, 1, 0, 0.9764706, 1,
0.9726797, -0.9724861, 3.025892, 1, 0, 0.972549, 1,
0.9791172, 0.9030593, 1.149399, 1, 0, 0.9647059, 1,
0.9854389, -0.1010116, -0.3943905, 1, 0, 0.9607843, 1,
0.9864352, -0.7957228, 0.7141799, 1, 0, 0.9529412, 1,
0.989188, -1.09438, 1.039672, 1, 0, 0.9490196, 1,
0.9938841, 0.5066368, 1.270071, 1, 0, 0.9411765, 1,
0.996383, 0.9604462, 1.078045, 1, 0, 0.9372549, 1,
1.005515, -0.04934601, 2.268782, 1, 0, 0.9294118, 1,
1.016892, 1.149886, -0.57937, 1, 0, 0.9254902, 1,
1.021945, 1.206398, 0.9352595, 1, 0, 0.9176471, 1,
1.034481, -1.481459, 3.004126, 1, 0, 0.9137255, 1,
1.036004, 0.6479065, -0.2660171, 1, 0, 0.9058824, 1,
1.039489, 0.5377504, 0.6242827, 1, 0, 0.9019608, 1,
1.044533, -0.9417461, 2.600167, 1, 0, 0.8941177, 1,
1.049147, -0.3220043, 3.236788, 1, 0, 0.8862745, 1,
1.051129, 2.03246, -0.2846127, 1, 0, 0.8823529, 1,
1.051265, -0.7314059, 2.52012, 1, 0, 0.8745098, 1,
1.055057, -1.165442, 3.04566, 1, 0, 0.8705882, 1,
1.062038, -0.2220084, 0.4985216, 1, 0, 0.8627451, 1,
1.084127, 0.6106646, 1.240774, 1, 0, 0.8588235, 1,
1.085921, -1.679764, 0.1515387, 1, 0, 0.8509804, 1,
1.088997, 0.1621256, 0.4365797, 1, 0, 0.8470588, 1,
1.093206, -0.843633, -0.1336316, 1, 0, 0.8392157, 1,
1.0956, 0.1157911, 0.876524, 1, 0, 0.8352941, 1,
1.101188, -1.040852, 4.509171, 1, 0, 0.827451, 1,
1.102012, 0.06726933, 1.719961, 1, 0, 0.8235294, 1,
1.102358, -1.35972, 2.665028, 1, 0, 0.8156863, 1,
1.120877, 0.2323703, 0.5989563, 1, 0, 0.8117647, 1,
1.123647, 0.4196521, 2.826521, 1, 0, 0.8039216, 1,
1.130034, -2.114836, 2.019779, 1, 0, 0.7960784, 1,
1.133839, 0.6253538, 0.8573439, 1, 0, 0.7921569, 1,
1.134392, -0.3388252, 1.237204, 1, 0, 0.7843137, 1,
1.144594, 0.1421678, 1.669486, 1, 0, 0.7803922, 1,
1.145386, 0.5794039, 0.6977247, 1, 0, 0.772549, 1,
1.148218, 0.2363639, -0.1694132, 1, 0, 0.7686275, 1,
1.148971, -0.7006437, 1.197502, 1, 0, 0.7607843, 1,
1.152362, -0.3030797, 2.525985, 1, 0, 0.7568628, 1,
1.172936, -0.2929651, 2.272962, 1, 0, 0.7490196, 1,
1.17404, 1.99919, 0.1565177, 1, 0, 0.7450981, 1,
1.174306, 0.03454904, 2.152537, 1, 0, 0.7372549, 1,
1.178535, -0.5686561, 3.88921, 1, 0, 0.7333333, 1,
1.18616, -2.120442, 2.662804, 1, 0, 0.7254902, 1,
1.210501, -1.812165, 3.607021, 1, 0, 0.7215686, 1,
1.210598, -0.06450277, 0.7509202, 1, 0, 0.7137255, 1,
1.213939, -0.3203331, 1.365816, 1, 0, 0.7098039, 1,
1.220058, -0.4357599, 1.662213, 1, 0, 0.7019608, 1,
1.233899, -1.530319, 3.56992, 1, 0, 0.6941177, 1,
1.234695, 0.8470938, 1.393295, 1, 0, 0.6901961, 1,
1.234844, -0.4947459, 1.589266, 1, 0, 0.682353, 1,
1.238158, 0.6179252, 1.160722, 1, 0, 0.6784314, 1,
1.242317, -0.07530751, 1.19757, 1, 0, 0.6705883, 1,
1.24386, -0.1604364, 2.24458, 1, 0, 0.6666667, 1,
1.248453, 0.3175417, 1.82207, 1, 0, 0.6588235, 1,
1.251909, 0.1859603, 2.705953, 1, 0, 0.654902, 1,
1.252329, 0.4600931, 2.260106, 1, 0, 0.6470588, 1,
1.25325, -0.1547843, 0.955399, 1, 0, 0.6431373, 1,
1.258649, -0.7167608, 1.925379, 1, 0, 0.6352941, 1,
1.263648, 0.142521, 2.797741, 1, 0, 0.6313726, 1,
1.279842, -0.1504476, 1.098393, 1, 0, 0.6235294, 1,
1.306622, -0.6425927, 1.672552, 1, 0, 0.6196079, 1,
1.312311, -2.335274, 3.429662, 1, 0, 0.6117647, 1,
1.31478, 0.5008044, 1.97107, 1, 0, 0.6078432, 1,
1.326045, 0.314441, 0.8360512, 1, 0, 0.6, 1,
1.326463, 0.8031565, 1.670282, 1, 0, 0.5921569, 1,
1.326991, -0.1232692, 1.876108, 1, 0, 0.5882353, 1,
1.334686, -0.929078, 0.7691013, 1, 0, 0.5803922, 1,
1.334932, 2.056084, 0.3269353, 1, 0, 0.5764706, 1,
1.335882, 0.4268548, 1.516619, 1, 0, 0.5686275, 1,
1.341822, -1.559197, 3.145134, 1, 0, 0.5647059, 1,
1.346577, -0.7161947, 1.549586, 1, 0, 0.5568628, 1,
1.351003, 0.5213174, 2.557076, 1, 0, 0.5529412, 1,
1.352101, 0.05533931, 1.314175, 1, 0, 0.5450981, 1,
1.360469, 0.2992981, 1.790535, 1, 0, 0.5411765, 1,
1.36622, -1.710672, 1.393605, 1, 0, 0.5333334, 1,
1.370547, 0.9552296, 1.466742, 1, 0, 0.5294118, 1,
1.374197, -1.220049, 2.694493, 1, 0, 0.5215687, 1,
1.382559, 0.955035, 0.7171845, 1, 0, 0.5176471, 1,
1.389712, -0.3670247, 2.145099, 1, 0, 0.509804, 1,
1.395006, -0.51901, 1.736059, 1, 0, 0.5058824, 1,
1.404987, 1.472238, 0.3389719, 1, 0, 0.4980392, 1,
1.406692, 0.6679962, -0.9818991, 1, 0, 0.4901961, 1,
1.418769, -0.1275489, 2.938979, 1, 0, 0.4862745, 1,
1.42722, -2.023842, 1.937154, 1, 0, 0.4784314, 1,
1.439961, -0.5885183, 1.654776, 1, 0, 0.4745098, 1,
1.463888, 1.416048, 1.237022, 1, 0, 0.4666667, 1,
1.470677, 1.936694, 1.480919, 1, 0, 0.4627451, 1,
1.477287, -0.3621112, 2.264115, 1, 0, 0.454902, 1,
1.494457, 0.4825701, -0.9449398, 1, 0, 0.4509804, 1,
1.507877, -0.7451046, 2.217931, 1, 0, 0.4431373, 1,
1.525579, -2.427098, 2.970843, 1, 0, 0.4392157, 1,
1.526637, -0.3280709, 0.6762702, 1, 0, 0.4313726, 1,
1.531052, -1.029577, 2.092796, 1, 0, 0.427451, 1,
1.545161, -0.6527202, 4.464831, 1, 0, 0.4196078, 1,
1.569039, -0.3161874, 3.485454, 1, 0, 0.4156863, 1,
1.569554, 1.305504, 1.920397, 1, 0, 0.4078431, 1,
1.575312, -0.01299305, 3.25715, 1, 0, 0.4039216, 1,
1.590208, -0.7658226, 2.429254, 1, 0, 0.3960784, 1,
1.59101, 0.3730429, 0.6420399, 1, 0, 0.3882353, 1,
1.595431, 0.54089, 1.271299, 1, 0, 0.3843137, 1,
1.603406, 0.3367648, 0.7431665, 1, 0, 0.3764706, 1,
1.614844, 0.05515311, -0.008499356, 1, 0, 0.372549, 1,
1.619068, -0.8879474, 2.813319, 1, 0, 0.3647059, 1,
1.622421, -0.09077842, -1.424087, 1, 0, 0.3607843, 1,
1.6296, 0.4001468, 2.057484, 1, 0, 0.3529412, 1,
1.653951, 0.5009114, 3.162774, 1, 0, 0.3490196, 1,
1.658462, -0.5043536, 0.06568395, 1, 0, 0.3411765, 1,
1.662947, -1.726045, 1.884716, 1, 0, 0.3372549, 1,
1.683838, -0.06110838, 2.185085, 1, 0, 0.3294118, 1,
1.684386, -0.1545012, 2.400152, 1, 0, 0.3254902, 1,
1.70466, -0.9693362, 1.210794, 1, 0, 0.3176471, 1,
1.716351, 1.392748, 0.8102925, 1, 0, 0.3137255, 1,
1.725883, -1.241967, 1.340647, 1, 0, 0.3058824, 1,
1.730213, -0.1659957, 2.722042, 1, 0, 0.2980392, 1,
1.730305, 0.4317865, 1.453824, 1, 0, 0.2941177, 1,
1.737557, 1.934748, 0.3258032, 1, 0, 0.2862745, 1,
1.752476, 1.593804, -0.02019495, 1, 0, 0.282353, 1,
1.754912, -0.5764806, 1.729787, 1, 0, 0.2745098, 1,
1.780394, 0.3738186, -0.33295, 1, 0, 0.2705882, 1,
1.793862, 2.081905, 1.400416, 1, 0, 0.2627451, 1,
1.799018, -0.5168136, 2.49752, 1, 0, 0.2588235, 1,
1.803085, -1.671386, 3.16595, 1, 0, 0.2509804, 1,
1.803951, 0.02497979, 1.693464, 1, 0, 0.2470588, 1,
1.814186, 0.6563678, 1.326255, 1, 0, 0.2392157, 1,
1.838502, 0.6556914, -0.03393096, 1, 0, 0.2352941, 1,
1.852022, 0.2949706, 2.697677, 1, 0, 0.227451, 1,
1.854758, 0.8719236, 0.8706854, 1, 0, 0.2235294, 1,
1.856037, -1.494953, 1.886043, 1, 0, 0.2156863, 1,
1.872133, 1.17395, 0.8065534, 1, 0, 0.2117647, 1,
1.872712, -0.2495383, 1.66253, 1, 0, 0.2039216, 1,
1.901779, -1.442427, 2.083175, 1, 0, 0.1960784, 1,
1.902322, -0.8038928, 1.107839, 1, 0, 0.1921569, 1,
1.939507, 1.020409, 0.595854, 1, 0, 0.1843137, 1,
1.954377, -0.5643552, 1.095898, 1, 0, 0.1803922, 1,
1.962967, -0.563511, 1.846538, 1, 0, 0.172549, 1,
1.962997, 0.8722901, -0.1466442, 1, 0, 0.1686275, 1,
1.96568, 1.082753, -0.1278773, 1, 0, 0.1607843, 1,
1.976903, 0.1848776, 1.700915, 1, 0, 0.1568628, 1,
1.986408, 0.1531971, 1.121002, 1, 0, 0.1490196, 1,
2.013036, -0.3213933, 1.842437, 1, 0, 0.145098, 1,
2.020988, -1.312663, 1.674837, 1, 0, 0.1372549, 1,
2.041827, 0.9016696, 1.052841, 1, 0, 0.1333333, 1,
2.113711, 0.6474808, 1.442454, 1, 0, 0.1254902, 1,
2.114431, -0.1406177, 0.4815142, 1, 0, 0.1215686, 1,
2.133764, -0.03753643, 1.14769, 1, 0, 0.1137255, 1,
2.165515, 0.1734841, 1.702099, 1, 0, 0.1098039, 1,
2.174361, 0.7218571, 1.97022, 1, 0, 0.1019608, 1,
2.189528, -0.06233297, 1.726138, 1, 0, 0.09411765, 1,
2.226875, 0.3675048, 1.583375, 1, 0, 0.09019608, 1,
2.229878, 1.286368, 0.3773864, 1, 0, 0.08235294, 1,
2.238382, 0.851308, 1.140478, 1, 0, 0.07843138, 1,
2.363921, -0.5611854, 2.849074, 1, 0, 0.07058824, 1,
2.370741, 2.889241, -0.236171, 1, 0, 0.06666667, 1,
2.398209, 0.1825537, 1.701005, 1, 0, 0.05882353, 1,
2.451974, -0.3569269, 2.319148, 1, 0, 0.05490196, 1,
2.485512, 0.8301419, 2.53727, 1, 0, 0.04705882, 1,
2.555095, 1.366357, 1.255504, 1, 0, 0.04313726, 1,
2.590982, -0.2267826, 2.083006, 1, 0, 0.03529412, 1,
2.685069, -0.8508859, 2.572989, 1, 0, 0.03137255, 1,
2.763728, 0.08830228, 0.918278, 1, 0, 0.02352941, 1,
2.808017, 0.4432319, 4.013384, 1, 0, 0.01960784, 1,
3.093639, 0.7360879, 1.928705, 1, 0, 0.01176471, 1,
3.15106, 1.255629, 0.6794322, 1, 0, 0.007843138, 1
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
0.1190698, -4.24611, -7.163745, 0, -0.5, 0.5, 0.5,
0.1190698, -4.24611, -7.163745, 1, -0.5, 0.5, 0.5,
0.1190698, -4.24611, -7.163745, 1, 1.5, 0.5, 0.5,
0.1190698, -4.24611, -7.163745, 0, 1.5, 0.5, 0.5
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
-3.940765, 0.1964052, -7.163745, 0, -0.5, 0.5, 0.5,
-3.940765, 0.1964052, -7.163745, 1, -0.5, 0.5, 0.5,
-3.940765, 0.1964052, -7.163745, 1, 1.5, 0.5, 0.5,
-3.940765, 0.1964052, -7.163745, 0, 1.5, 0.5, 0.5
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
-3.940765, -4.24611, -0.09951997, 0, -0.5, 0.5, 0.5,
-3.940765, -4.24611, -0.09951997, 1, -0.5, 0.5, 0.5,
-3.940765, -4.24611, -0.09951997, 1, 1.5, 0.5, 0.5,
-3.940765, -4.24611, -0.09951997, 0, 1.5, 0.5, 0.5
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
-2, -3.220914, -5.533539,
3, -3.220914, -5.533539,
-2, -3.220914, -5.533539,
-2, -3.39178, -5.805241,
-1, -3.220914, -5.533539,
-1, -3.39178, -5.805241,
0, -3.220914, -5.533539,
0, -3.39178, -5.805241,
1, -3.220914, -5.533539,
1, -3.39178, -5.805241,
2, -3.220914, -5.533539,
2, -3.39178, -5.805241,
3, -3.220914, -5.533539,
3, -3.39178, -5.805241
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
-2, -3.733512, -6.348642, 0, -0.5, 0.5, 0.5,
-2, -3.733512, -6.348642, 1, -0.5, 0.5, 0.5,
-2, -3.733512, -6.348642, 1, 1.5, 0.5, 0.5,
-2, -3.733512, -6.348642, 0, 1.5, 0.5, 0.5,
-1, -3.733512, -6.348642, 0, -0.5, 0.5, 0.5,
-1, -3.733512, -6.348642, 1, -0.5, 0.5, 0.5,
-1, -3.733512, -6.348642, 1, 1.5, 0.5, 0.5,
-1, -3.733512, -6.348642, 0, 1.5, 0.5, 0.5,
0, -3.733512, -6.348642, 0, -0.5, 0.5, 0.5,
0, -3.733512, -6.348642, 1, -0.5, 0.5, 0.5,
0, -3.733512, -6.348642, 1, 1.5, 0.5, 0.5,
0, -3.733512, -6.348642, 0, 1.5, 0.5, 0.5,
1, -3.733512, -6.348642, 0, -0.5, 0.5, 0.5,
1, -3.733512, -6.348642, 1, -0.5, 0.5, 0.5,
1, -3.733512, -6.348642, 1, 1.5, 0.5, 0.5,
1, -3.733512, -6.348642, 0, 1.5, 0.5, 0.5,
2, -3.733512, -6.348642, 0, -0.5, 0.5, 0.5,
2, -3.733512, -6.348642, 1, -0.5, 0.5, 0.5,
2, -3.733512, -6.348642, 1, 1.5, 0.5, 0.5,
2, -3.733512, -6.348642, 0, 1.5, 0.5, 0.5,
3, -3.733512, -6.348642, 0, -0.5, 0.5, 0.5,
3, -3.733512, -6.348642, 1, -0.5, 0.5, 0.5,
3, -3.733512, -6.348642, 1, 1.5, 0.5, 0.5,
3, -3.733512, -6.348642, 0, 1.5, 0.5, 0.5
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
-3.00388, -3, -5.533539,
-3.00388, 3, -5.533539,
-3.00388, -3, -5.533539,
-3.160028, -3, -5.805241,
-3.00388, -2, -5.533539,
-3.160028, -2, -5.805241,
-3.00388, -1, -5.533539,
-3.160028, -1, -5.805241,
-3.00388, 0, -5.533539,
-3.160028, 0, -5.805241,
-3.00388, 1, -5.533539,
-3.160028, 1, -5.805241,
-3.00388, 2, -5.533539,
-3.160028, 2, -5.805241,
-3.00388, 3, -5.533539,
-3.160028, 3, -5.805241
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
-3.472323, -3, -6.348642, 0, -0.5, 0.5, 0.5,
-3.472323, -3, -6.348642, 1, -0.5, 0.5, 0.5,
-3.472323, -3, -6.348642, 1, 1.5, 0.5, 0.5,
-3.472323, -3, -6.348642, 0, 1.5, 0.5, 0.5,
-3.472323, -2, -6.348642, 0, -0.5, 0.5, 0.5,
-3.472323, -2, -6.348642, 1, -0.5, 0.5, 0.5,
-3.472323, -2, -6.348642, 1, 1.5, 0.5, 0.5,
-3.472323, -2, -6.348642, 0, 1.5, 0.5, 0.5,
-3.472323, -1, -6.348642, 0, -0.5, 0.5, 0.5,
-3.472323, -1, -6.348642, 1, -0.5, 0.5, 0.5,
-3.472323, -1, -6.348642, 1, 1.5, 0.5, 0.5,
-3.472323, -1, -6.348642, 0, 1.5, 0.5, 0.5,
-3.472323, 0, -6.348642, 0, -0.5, 0.5, 0.5,
-3.472323, 0, -6.348642, 1, -0.5, 0.5, 0.5,
-3.472323, 0, -6.348642, 1, 1.5, 0.5, 0.5,
-3.472323, 0, -6.348642, 0, 1.5, 0.5, 0.5,
-3.472323, 1, -6.348642, 0, -0.5, 0.5, 0.5,
-3.472323, 1, -6.348642, 1, -0.5, 0.5, 0.5,
-3.472323, 1, -6.348642, 1, 1.5, 0.5, 0.5,
-3.472323, 1, -6.348642, 0, 1.5, 0.5, 0.5,
-3.472323, 2, -6.348642, 0, -0.5, 0.5, 0.5,
-3.472323, 2, -6.348642, 1, -0.5, 0.5, 0.5,
-3.472323, 2, -6.348642, 1, 1.5, 0.5, 0.5,
-3.472323, 2, -6.348642, 0, 1.5, 0.5, 0.5,
-3.472323, 3, -6.348642, 0, -0.5, 0.5, 0.5,
-3.472323, 3, -6.348642, 1, -0.5, 0.5, 0.5,
-3.472323, 3, -6.348642, 1, 1.5, 0.5, 0.5,
-3.472323, 3, -6.348642, 0, 1.5, 0.5, 0.5
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
-3.00388, -3.220914, -4,
-3.00388, -3.220914, 4,
-3.00388, -3.220914, -4,
-3.160028, -3.39178, -4,
-3.00388, -3.220914, -2,
-3.160028, -3.39178, -2,
-3.00388, -3.220914, 0,
-3.160028, -3.39178, 0,
-3.00388, -3.220914, 2,
-3.160028, -3.39178, 2,
-3.00388, -3.220914, 4,
-3.160028, -3.39178, 4
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
-3.472323, -3.733512, -4, 0, -0.5, 0.5, 0.5,
-3.472323, -3.733512, -4, 1, -0.5, 0.5, 0.5,
-3.472323, -3.733512, -4, 1, 1.5, 0.5, 0.5,
-3.472323, -3.733512, -4, 0, 1.5, 0.5, 0.5,
-3.472323, -3.733512, -2, 0, -0.5, 0.5, 0.5,
-3.472323, -3.733512, -2, 1, -0.5, 0.5, 0.5,
-3.472323, -3.733512, -2, 1, 1.5, 0.5, 0.5,
-3.472323, -3.733512, -2, 0, 1.5, 0.5, 0.5,
-3.472323, -3.733512, 0, 0, -0.5, 0.5, 0.5,
-3.472323, -3.733512, 0, 1, -0.5, 0.5, 0.5,
-3.472323, -3.733512, 0, 1, 1.5, 0.5, 0.5,
-3.472323, -3.733512, 0, 0, 1.5, 0.5, 0.5,
-3.472323, -3.733512, 2, 0, -0.5, 0.5, 0.5,
-3.472323, -3.733512, 2, 1, -0.5, 0.5, 0.5,
-3.472323, -3.733512, 2, 1, 1.5, 0.5, 0.5,
-3.472323, -3.733512, 2, 0, 1.5, 0.5, 0.5,
-3.472323, -3.733512, 4, 0, -0.5, 0.5, 0.5,
-3.472323, -3.733512, 4, 1, -0.5, 0.5, 0.5,
-3.472323, -3.733512, 4, 1, 1.5, 0.5, 0.5,
-3.472323, -3.733512, 4, 0, 1.5, 0.5, 0.5
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
-3.00388, -3.220914, -5.533539,
-3.00388, 3.613724, -5.533539,
-3.00388, -3.220914, 5.334499,
-3.00388, 3.613724, 5.334499,
-3.00388, -3.220914, -5.533539,
-3.00388, -3.220914, 5.334499,
-3.00388, 3.613724, -5.533539,
-3.00388, 3.613724, 5.334499,
-3.00388, -3.220914, -5.533539,
3.24202, -3.220914, -5.533539,
-3.00388, -3.220914, 5.334499,
3.24202, -3.220914, 5.334499,
-3.00388, 3.613724, -5.533539,
3.24202, 3.613724, -5.533539,
-3.00388, 3.613724, 5.334499,
3.24202, 3.613724, 5.334499,
3.24202, -3.220914, -5.533539,
3.24202, 3.613724, -5.533539,
3.24202, -3.220914, 5.334499,
3.24202, 3.613724, 5.334499,
3.24202, -3.220914, -5.533539,
3.24202, -3.220914, 5.334499,
3.24202, 3.613724, -5.533539,
3.24202, 3.613724, 5.334499
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
var radius = 7.623736;
var distance = 33.91886;
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
mvMatrix.translate( -0.1190698, -0.1964052, 0.09951997 );
mvMatrix.scale( 1.319735, 1.206052, 0.7584563 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.91886);
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
vamidothion<-read.table("vamidothion.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-vamidothion$V2
```

```
## Error in eval(expr, envir, enclos): object 'vamidothion' not found
```

```r
y<-vamidothion$V3
```

```
## Error in eval(expr, envir, enclos): object 'vamidothion' not found
```

```r
z<-vamidothion$V4
```

```
## Error in eval(expr, envir, enclos): object 'vamidothion' not found
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
-2.91292, -1.706128, -2.179739, 0, 0, 1, 1, 1,
-2.863469, -0.3432014, -0.9499025, 1, 0, 0, 1, 1,
-2.827414, -0.670083, -0.7836806, 1, 0, 0, 1, 1,
-2.736721, -0.290362, -2.006317, 1, 0, 0, 1, 1,
-2.701245, -0.04290893, 0.5792833, 1, 0, 0, 1, 1,
-2.679884, -0.2096357, -2.027424, 1, 0, 0, 1, 1,
-2.580367, 0.5369752, -0.5514606, 0, 0, 0, 1, 1,
-2.549344, -0.4653468, -1.229157, 0, 0, 0, 1, 1,
-2.540791, 1.11158, -3.132682, 0, 0, 0, 1, 1,
-2.525906, -0.2004061, -2.084755, 0, 0, 0, 1, 1,
-2.506602, 0.145668, -1.794552, 0, 0, 0, 1, 1,
-2.422837, 0.5775299, -2.206947, 0, 0, 0, 1, 1,
-2.391341, 0.5613148, -1.085313, 0, 0, 0, 1, 1,
-2.34783, 0.008847001, -2.6753, 1, 1, 1, 1, 1,
-2.326236, 2.072083, -0.8967605, 1, 1, 1, 1, 1,
-2.309882, 0.8517017, -0.3860397, 1, 1, 1, 1, 1,
-2.300593, 1.268053, -1.683652, 1, 1, 1, 1, 1,
-2.291462, 0.04764474, -1.585867, 1, 1, 1, 1, 1,
-2.265539, 0.6262057, -1.959504, 1, 1, 1, 1, 1,
-2.232349, -0.7702842, 0.2164674, 1, 1, 1, 1, 1,
-2.220292, 0.3339537, -0.4716035, 1, 1, 1, 1, 1,
-2.161271, 0.8725427, -1.889488, 1, 1, 1, 1, 1,
-2.159961, 0.8922768, -1.141234, 1, 1, 1, 1, 1,
-2.128451, 0.81496, 0.4096105, 1, 1, 1, 1, 1,
-2.10998, -0.5614219, -2.173784, 1, 1, 1, 1, 1,
-2.104018, -0.5752646, -2.813037, 1, 1, 1, 1, 1,
-2.102053, 0.38547, -0.1436587, 1, 1, 1, 1, 1,
-2.067807, -1.153016, -1.180404, 1, 1, 1, 1, 1,
-2.058841, 0.8357407, -1.778199, 0, 0, 1, 1, 1,
-2.051154, -1.032582, -3.446557, 1, 0, 0, 1, 1,
-2.024966, 0.6715865, -0.723973, 1, 0, 0, 1, 1,
-2.005881, 1.031955, -1.822919, 1, 0, 0, 1, 1,
-1.967951, -0.3499896, -1.360958, 1, 0, 0, 1, 1,
-1.967737, -0.3676272, -1.991601, 1, 0, 0, 1, 1,
-1.951955, -0.4769427, -2.128563, 0, 0, 0, 1, 1,
-1.936832, 0.602205, -1.004482, 0, 0, 0, 1, 1,
-1.927968, 0.1201884, -0.8415563, 0, 0, 0, 1, 1,
-1.876876, -0.205426, -2.478551, 0, 0, 0, 1, 1,
-1.876481, 0.8169059, -2.695984, 0, 0, 0, 1, 1,
-1.868751, -1.323393, -2.465211, 0, 0, 0, 1, 1,
-1.865731, 2.129844, -0.3355408, 0, 0, 0, 1, 1,
-1.85149, 0.4405137, -0.3370582, 1, 1, 1, 1, 1,
-1.842551, -0.3345367, -1.208408, 1, 1, 1, 1, 1,
-1.837149, -0.04605291, -2.488377, 1, 1, 1, 1, 1,
-1.833237, -1.466747, -2.931433, 1, 1, 1, 1, 1,
-1.830471, -0.3109873, -2.896874, 1, 1, 1, 1, 1,
-1.771166, 0.6849167, -2.325505, 1, 1, 1, 1, 1,
-1.770898, 0.2410037, -2.251775, 1, 1, 1, 1, 1,
-1.752494, 0.5433648, -1.82777, 1, 1, 1, 1, 1,
-1.744584, 0.877123, -2.511031, 1, 1, 1, 1, 1,
-1.735056, 0.2379287, -1.863143, 1, 1, 1, 1, 1,
-1.733169, -0.06176792, -1.549965, 1, 1, 1, 1, 1,
-1.686383, 0.4158782, 0.8540215, 1, 1, 1, 1, 1,
-1.660043, -1.447577, -1.527265, 1, 1, 1, 1, 1,
-1.65035, -0.3562997, -0.5528953, 1, 1, 1, 1, 1,
-1.650284, -0.2574064, -1.844231, 1, 1, 1, 1, 1,
-1.647497, -0.6308537, -1.975993, 0, 0, 1, 1, 1,
-1.644896, 1.542494, -3.487632, 1, 0, 0, 1, 1,
-1.643368, -0.695783, -0.881664, 1, 0, 0, 1, 1,
-1.639397, -0.2399937, -0.3181325, 1, 0, 0, 1, 1,
-1.620923, -0.1147791, -1.896509, 1, 0, 0, 1, 1,
-1.619221, -1.92656, -3.192436, 1, 0, 0, 1, 1,
-1.575828, 1.319405, -3.51832, 0, 0, 0, 1, 1,
-1.567154, 0.1939934, -4.058748, 0, 0, 0, 1, 1,
-1.565968, -0.1087187, -2.146197, 0, 0, 0, 1, 1,
-1.564927, 0.05595976, -0.2779382, 0, 0, 0, 1, 1,
-1.553207, -0.0633634, -1.006607, 0, 0, 0, 1, 1,
-1.54358, -0.742635, -1.594381, 0, 0, 0, 1, 1,
-1.535882, -1.331669, -3.08294, 0, 0, 0, 1, 1,
-1.531751, -2.109968, -2.016437, 1, 1, 1, 1, 1,
-1.524332, 0.4615455, -0.1881515, 1, 1, 1, 1, 1,
-1.514816, -1.798425, -2.590977, 1, 1, 1, 1, 1,
-1.508176, -1.49782, -0.9642754, 1, 1, 1, 1, 1,
-1.504029, -1.793884, -2.802037, 1, 1, 1, 1, 1,
-1.487628, -2.174487, -2.284982, 1, 1, 1, 1, 1,
-1.487443, -0.1685525, -1.907071, 1, 1, 1, 1, 1,
-1.467477, 0.5800709, 0.9559414, 1, 1, 1, 1, 1,
-1.463809, 0.3014236, -0.953319, 1, 1, 1, 1, 1,
-1.445428, -0.2956997, -1.148219, 1, 1, 1, 1, 1,
-1.44185, 0.639494, -1.027242, 1, 1, 1, 1, 1,
-1.435166, 0.8785025, -0.932868, 1, 1, 1, 1, 1,
-1.42434, -2.069763, -3.148383, 1, 1, 1, 1, 1,
-1.419351, -0.5148154, -2.103801, 1, 1, 1, 1, 1,
-1.407504, 0.1451271, 0.2484198, 1, 1, 1, 1, 1,
-1.406029, 0.6648141, -1.556751, 0, 0, 1, 1, 1,
-1.401797, 3.514191, -1.557822, 1, 0, 0, 1, 1,
-1.3865, 0.8359539, -0.9621733, 1, 0, 0, 1, 1,
-1.386347, 1.675815, -0.5742934, 1, 0, 0, 1, 1,
-1.385726, -1.005751, -3.419949, 1, 0, 0, 1, 1,
-1.379398, 1.450057, -1.532771, 1, 0, 0, 1, 1,
-1.378805, -0.2627892, -1.788061, 0, 0, 0, 1, 1,
-1.376778, 0.2968281, -0.9244254, 0, 0, 0, 1, 1,
-1.370007, 0.1426295, -0.366181, 0, 0, 0, 1, 1,
-1.351543, 0.1452137, -2.139247, 0, 0, 0, 1, 1,
-1.350951, -1.688198, -3.084767, 0, 0, 0, 1, 1,
-1.348915, 1.093358, -0.58871, 0, 0, 0, 1, 1,
-1.347868, 0.8377762, 1.003613, 0, 0, 0, 1, 1,
-1.333331, 0.3653564, -1.055256, 1, 1, 1, 1, 1,
-1.330038, 0.2367105, -1.618986, 1, 1, 1, 1, 1,
-1.329105, 0.819973, -1.803071, 1, 1, 1, 1, 1,
-1.318629, 1.241535, 0.006189915, 1, 1, 1, 1, 1,
-1.31602, 0.3104297, -1.530861, 1, 1, 1, 1, 1,
-1.310024, 0.764471, -0.4789644, 1, 1, 1, 1, 1,
-1.307542, -2.094388, -1.187734, 1, 1, 1, 1, 1,
-1.305346, 0.4737216, 0.8173538, 1, 1, 1, 1, 1,
-1.300495, -0.6397551, -2.540546, 1, 1, 1, 1, 1,
-1.292565, -1.883915, -2.956872, 1, 1, 1, 1, 1,
-1.292429, 0.7763584, -1.793766, 1, 1, 1, 1, 1,
-1.285994, 0.3241723, -0.4211743, 1, 1, 1, 1, 1,
-1.277252, -1.938994, -2.76179, 1, 1, 1, 1, 1,
-1.275725, -0.6353917, -0.03061238, 1, 1, 1, 1, 1,
-1.274446, 0.6456314, 0.192882, 1, 1, 1, 1, 1,
-1.249709, -1.505795, -1.845116, 0, 0, 1, 1, 1,
-1.248999, 0.2299515, -2.697269, 1, 0, 0, 1, 1,
-1.240406, 0.782961, -1.627011, 1, 0, 0, 1, 1,
-1.238399, -0.07818276, -0.797662, 1, 0, 0, 1, 1,
-1.237909, -1.078564, -1.108006, 1, 0, 0, 1, 1,
-1.229753, 1.488337, -0.5664672, 1, 0, 0, 1, 1,
-1.225364, -1.167964, -3.817145, 0, 0, 0, 1, 1,
-1.224954, 1.816185, -2.41998, 0, 0, 0, 1, 1,
-1.224289, -0.5470573, -1.490742, 0, 0, 0, 1, 1,
-1.221972, 1.605806, -0.1956085, 0, 0, 0, 1, 1,
-1.210165, -0.6558406, -3.571518, 0, 0, 0, 1, 1,
-1.20697, -2.792231, -2.071624, 0, 0, 0, 1, 1,
-1.188416, 1.241566, -1.130222, 0, 0, 0, 1, 1,
-1.182563, 1.576654, -1.601075, 1, 1, 1, 1, 1,
-1.180605, 0.840721, 0.4450891, 1, 1, 1, 1, 1,
-1.176393, -1.476415, -2.289814, 1, 1, 1, 1, 1,
-1.172222, -0.1278978, 0.07914282, 1, 1, 1, 1, 1,
-1.167553, 1.764307, 1.244001, 1, 1, 1, 1, 1,
-1.16589, 1.100909, 0.7036362, 1, 1, 1, 1, 1,
-1.165504, 0.5727141, 0.2948084, 1, 1, 1, 1, 1,
-1.165482, 2.192561, -1.322069, 1, 1, 1, 1, 1,
-1.158888, 1.008043, 0.6715994, 1, 1, 1, 1, 1,
-1.156121, -1.696524, -3.310493, 1, 1, 1, 1, 1,
-1.155386, 0.0361243, -2.359563, 1, 1, 1, 1, 1,
-1.147248, -0.004852577, -1.064947, 1, 1, 1, 1, 1,
-1.144677, -0.03706656, -2.491863, 1, 1, 1, 1, 1,
-1.136149, 0.1952396, -1.689931, 1, 1, 1, 1, 1,
-1.131915, -0.2738298, -1.70666, 1, 1, 1, 1, 1,
-1.131427, -0.7218144, -3.237645, 0, 0, 1, 1, 1,
-1.127937, -0.09638979, -3.25669, 1, 0, 0, 1, 1,
-1.124838, -1.351618, -3.287424, 1, 0, 0, 1, 1,
-1.123433, -0.9426331, -2.133898, 1, 0, 0, 1, 1,
-1.121065, 0.8193002, -2.447333, 1, 0, 0, 1, 1,
-1.117822, -0.6462198, -1.377807, 1, 0, 0, 1, 1,
-1.10429, -0.4057782, -2.195287, 0, 0, 0, 1, 1,
-1.103106, 2.546915, -0.5517963, 0, 0, 0, 1, 1,
-1.102241, 0.2786423, -2.464316, 0, 0, 0, 1, 1,
-1.098338, -0.9626967, -1.167192, 0, 0, 0, 1, 1,
-1.096515, -0.4837269, -3.259726, 0, 0, 0, 1, 1,
-1.092193, -1.206186, -1.540877, 0, 0, 0, 1, 1,
-1.090542, -0.8682833, -1.993062, 0, 0, 0, 1, 1,
-1.089458, -1.340438, -1.828221, 1, 1, 1, 1, 1,
-1.086467, 0.9308927, 0.8073043, 1, 1, 1, 1, 1,
-1.080869, 0.8113469, -0.662779, 1, 1, 1, 1, 1,
-1.072464, -1.064086, -1.539293, 1, 1, 1, 1, 1,
-1.064917, -1.423681, -1.187082, 1, 1, 1, 1, 1,
-1.064378, -1.847327, -3.165516, 1, 1, 1, 1, 1,
-1.063672, 0.4451645, -1.009726, 1, 1, 1, 1, 1,
-1.056315, 0.02620798, -1.956264, 1, 1, 1, 1, 1,
-1.052484, 0.04333747, -2.672878, 1, 1, 1, 1, 1,
-1.047171, 1.32053, -1.032346, 1, 1, 1, 1, 1,
-1.04631, 0.2463634, -2.042176, 1, 1, 1, 1, 1,
-1.046222, -0.1022848, -1.355718, 1, 1, 1, 1, 1,
-1.046036, -1.182082, -2.207834, 1, 1, 1, 1, 1,
-1.045123, 0.5393816, -0.03612683, 1, 1, 1, 1, 1,
-1.044064, 0.08825883, -0.5641127, 1, 1, 1, 1, 1,
-1.03919, 0.1214563, -1.79214, 0, 0, 1, 1, 1,
-1.033143, 0.4771998, 0.9725723, 1, 0, 0, 1, 1,
-1.028412, 0.003397523, -1.369779, 1, 0, 0, 1, 1,
-1.0208, -0.6525263, -0.9603246, 1, 0, 0, 1, 1,
-1.006669, 1.570753, -1.010221, 1, 0, 0, 1, 1,
-1.005949, 1.280588, -2.107867, 1, 0, 0, 1, 1,
-1.002028, -0.2626724, -1.24095, 0, 0, 0, 1, 1,
-0.9919408, -0.712849, -2.517902, 0, 0, 0, 1, 1,
-0.9888477, -1.053385, -2.204084, 0, 0, 0, 1, 1,
-0.9864353, 0.6471165, 0.4910686, 0, 0, 0, 1, 1,
-0.9862117, -1.472362, -4.39689, 0, 0, 0, 1, 1,
-0.9813849, 0.3224218, -0.2002794, 0, 0, 0, 1, 1,
-0.9765875, -1.189512, -0.165071, 0, 0, 0, 1, 1,
-0.9686015, -0.8521785, -1.4576, 1, 1, 1, 1, 1,
-0.9673675, 1.696054, 1.042096, 1, 1, 1, 1, 1,
-0.9662904, -0.1727941, -0.01270837, 1, 1, 1, 1, 1,
-0.9655089, -0.00200814, -2.030172, 1, 1, 1, 1, 1,
-0.9583463, 0.01905254, -3.0904, 1, 1, 1, 1, 1,
-0.9577377, 0.6828108, -0.9592288, 1, 1, 1, 1, 1,
-0.9513677, 0.4164873, -1.929079, 1, 1, 1, 1, 1,
-0.9441807, -0.7102835, -1.407197, 1, 1, 1, 1, 1,
-0.9399551, 0.5074037, -0.62205, 1, 1, 1, 1, 1,
-0.9361705, -0.5708621, -1.354004, 1, 1, 1, 1, 1,
-0.9357294, -1.268471, -2.047223, 1, 1, 1, 1, 1,
-0.9269753, -0.4225625, -2.382691, 1, 1, 1, 1, 1,
-0.9218073, 0.2716671, -0.5518066, 1, 1, 1, 1, 1,
-0.9179174, -0.09732569, -1.912822, 1, 1, 1, 1, 1,
-0.9167466, -1.347452, -3.986706, 1, 1, 1, 1, 1,
-0.9158905, -2.209987, -1.07238, 0, 0, 1, 1, 1,
-0.9137017, -1.454717, -2.085082, 1, 0, 0, 1, 1,
-0.9119951, 0.9827214, -0.559725, 1, 0, 0, 1, 1,
-0.9089593, -0.7280952, -1.998217, 1, 0, 0, 1, 1,
-0.9059134, 0.9753602, 0.9307051, 1, 0, 0, 1, 1,
-0.9033355, -1.129812, -3.576265, 1, 0, 0, 1, 1,
-0.8950208, 0.4004782, 0.5788229, 0, 0, 0, 1, 1,
-0.8880455, 0.06973344, -2.671113, 0, 0, 0, 1, 1,
-0.881364, 1.856323, -1.08872, 0, 0, 0, 1, 1,
-0.8796287, 0.3960138, -1.06773, 0, 0, 0, 1, 1,
-0.8795314, 1.002385, -0.2444315, 0, 0, 0, 1, 1,
-0.8757247, -0.2453954, -1.971147, 0, 0, 0, 1, 1,
-0.8730579, -0.9727823, -2.416229, 0, 0, 0, 1, 1,
-0.8632505, 1.348284, -1.149643, 1, 1, 1, 1, 1,
-0.858286, 0.6772816, -1.111088, 1, 1, 1, 1, 1,
-0.848765, -0.428364, -1.549779, 1, 1, 1, 1, 1,
-0.8456163, -0.3469526, -0.7725139, 1, 1, 1, 1, 1,
-0.8407397, -0.06191103, -2.392646, 1, 1, 1, 1, 1,
-0.8395662, -1.284775, -1.889334, 1, 1, 1, 1, 1,
-0.8382925, 1.147263, 0.5210938, 1, 1, 1, 1, 1,
-0.8381999, 0.4997267, 0.3500251, 1, 1, 1, 1, 1,
-0.8378783, -0.6281085, -0.5170873, 1, 1, 1, 1, 1,
-0.8373693, 0.3220185, -2.492099, 1, 1, 1, 1, 1,
-0.8348827, 0.8063352, -0.5751787, 1, 1, 1, 1, 1,
-0.8348821, -0.05226158, -2.266194, 1, 1, 1, 1, 1,
-0.8326123, -0.4704547, -2.418357, 1, 1, 1, 1, 1,
-0.8253791, 0.2627973, -1.996213, 1, 1, 1, 1, 1,
-0.824154, -0.9975061, -1.336804, 1, 1, 1, 1, 1,
-0.8207846, 1.624178, -0.8553137, 0, 0, 1, 1, 1,
-0.8135046, 0.5913947, -1.970681, 1, 0, 0, 1, 1,
-0.8134406, 0.6652594, 0.6748534, 1, 0, 0, 1, 1,
-0.8115483, 1.690059, -2.081223, 1, 0, 0, 1, 1,
-0.8110041, 0.3219987, -1.696333, 1, 0, 0, 1, 1,
-0.8109523, -1.310912, -2.312855, 1, 0, 0, 1, 1,
-0.7997838, 0.1173295, -0.4812785, 0, 0, 0, 1, 1,
-0.7939463, 1.154271, 1.716317, 0, 0, 0, 1, 1,
-0.7904987, 0.4238068, -0.9499379, 0, 0, 0, 1, 1,
-0.7894796, 0.3984016, -0.2389922, 0, 0, 0, 1, 1,
-0.7872778, -1.985188, -1.370268, 0, 0, 0, 1, 1,
-0.7818495, 1.713804, -2.3431, 0, 0, 0, 1, 1,
-0.7809513, 0.4032573, 0.0939336, 0, 0, 0, 1, 1,
-0.7793082, 1.560655, -0.416903, 1, 1, 1, 1, 1,
-0.7752532, 0.4905884, 0.8904105, 1, 1, 1, 1, 1,
-0.7747145, -0.1672208, -1.504583, 1, 1, 1, 1, 1,
-0.774114, -0.1978073, -0.7258788, 1, 1, 1, 1, 1,
-0.7736924, 0.525762, -2.526759, 1, 1, 1, 1, 1,
-0.7729123, -0.8006702, -2.228471, 1, 1, 1, 1, 1,
-0.7723303, -0.05136586, -2.063978, 1, 1, 1, 1, 1,
-0.7692543, 0.6198401, -0.8838934, 1, 1, 1, 1, 1,
-0.7648208, 0.2907509, -3.422092, 1, 1, 1, 1, 1,
-0.7643303, -0.2125397, -2.016963, 1, 1, 1, 1, 1,
-0.7614927, 1.60395, 0.3441299, 1, 1, 1, 1, 1,
-0.7585402, -2.377215, -2.48351, 1, 1, 1, 1, 1,
-0.7558567, 0.2719483, -1.013361, 1, 1, 1, 1, 1,
-0.7536265, -0.8947532, -2.363627, 1, 1, 1, 1, 1,
-0.75063, 0.03565386, -2.427887, 1, 1, 1, 1, 1,
-0.7501929, 1.558865, -0.2691533, 0, 0, 1, 1, 1,
-0.748688, 0.2560182, -0.9981937, 1, 0, 0, 1, 1,
-0.7437736, -0.2230471, -0.9283139, 1, 0, 0, 1, 1,
-0.7399281, -1.776122, -2.121637, 1, 0, 0, 1, 1,
-0.7361534, 0.9342106, -0.6967476, 1, 0, 0, 1, 1,
-0.7317185, -0.4800628, -1.694292, 1, 0, 0, 1, 1,
-0.7307385, -1.804537, -2.504042, 0, 0, 0, 1, 1,
-0.7181739, -0.6632547, -1.274751, 0, 0, 0, 1, 1,
-0.7084796, 1.971991, 0.1405742, 0, 0, 0, 1, 1,
-0.7080693, -1.655009, -2.577423, 0, 0, 0, 1, 1,
-0.7071238, -1.838103, -2.62136, 0, 0, 0, 1, 1,
-0.7021456, -0.2504388, -1.80014, 0, 0, 0, 1, 1,
-0.7007763, -1.685199, -3.102115, 0, 0, 0, 1, 1,
-0.6985267, -1.400307, -1.913987, 1, 1, 1, 1, 1,
-0.6984168, 0.002684146, -0.9194732, 1, 1, 1, 1, 1,
-0.6964549, 0.0332253, 0.3649898, 1, 1, 1, 1, 1,
-0.694898, -0.7275315, -2.135056, 1, 1, 1, 1, 1,
-0.6861424, 0.1756387, -1.805686, 1, 1, 1, 1, 1,
-0.6835806, 1.13809, 0.4019085, 1, 1, 1, 1, 1,
-0.673338, -1.726099, -2.620899, 1, 1, 1, 1, 1,
-0.6719822, 0.0451211, -2.09506, 1, 1, 1, 1, 1,
-0.6644472, -0.02697513, -2.413701, 1, 1, 1, 1, 1,
-0.6596795, -1.191571, -2.132781, 1, 1, 1, 1, 1,
-0.6595371, -0.962913, -2.157883, 1, 1, 1, 1, 1,
-0.6580217, -1.069715, -0.4277619, 1, 1, 1, 1, 1,
-0.6573899, -0.1605411, -2.44229, 1, 1, 1, 1, 1,
-0.6531457, 0.1294902, -2.672125, 1, 1, 1, 1, 1,
-0.6504546, 1.871524, 0.08881595, 1, 1, 1, 1, 1,
-0.6476974, -0.1932004, -1.780149, 0, 0, 1, 1, 1,
-0.6452418, -0.6573885, -3.625079, 1, 0, 0, 1, 1,
-0.6406692, -1.049464, -1.441328, 1, 0, 0, 1, 1,
-0.640352, -0.6632813, -1.543779, 1, 0, 0, 1, 1,
-0.6381217, 0.4118958, -1.095539, 1, 0, 0, 1, 1,
-0.6370001, 1.190452, -1.673521, 1, 0, 0, 1, 1,
-0.63695, -1.743788, -3.186042, 0, 0, 0, 1, 1,
-0.6344207, -1.256387, -2.021064, 0, 0, 0, 1, 1,
-0.630176, -2.105124, -3.851551, 0, 0, 0, 1, 1,
-0.6277875, -1.655008, -2.022314, 0, 0, 0, 1, 1,
-0.6238142, -1.413348, -2.076732, 0, 0, 0, 1, 1,
-0.6233312, -0.04656412, -3.031721, 0, 0, 0, 1, 1,
-0.6135069, 0.6694607, -0.2603081, 0, 0, 0, 1, 1,
-0.610754, 1.642302, 0.4472138, 1, 1, 1, 1, 1,
-0.6090502, -2.416599, -3.951928, 1, 1, 1, 1, 1,
-0.6077091, -0.4349066, -2.160851, 1, 1, 1, 1, 1,
-0.6057457, 0.1909983, -0.965909, 1, 1, 1, 1, 1,
-0.6026912, 0.02119826, -1.025609, 1, 1, 1, 1, 1,
-0.6012162, -0.9192262, -2.064229, 1, 1, 1, 1, 1,
-0.5963016, 0.6804699, -0.3853283, 1, 1, 1, 1, 1,
-0.5935928, -0.6954103, -2.596877, 1, 1, 1, 1, 1,
-0.590008, -1.781685, -3.492553, 1, 1, 1, 1, 1,
-0.5895606, -0.1155064, -1.969159, 1, 1, 1, 1, 1,
-0.5866592, 0.7678114, -0.0634295, 1, 1, 1, 1, 1,
-0.5862351, 0.4714452, -2.25974, 1, 1, 1, 1, 1,
-0.5738686, 0.7449551, 0.2178347, 1, 1, 1, 1, 1,
-0.5706215, -1.764542, -1.317227, 1, 1, 1, 1, 1,
-0.5675708, 0.4402946, -1.64316, 1, 1, 1, 1, 1,
-0.5611372, -1.501608, -3.030246, 0, 0, 1, 1, 1,
-0.5483484, 0.5836942, -1.022457, 1, 0, 0, 1, 1,
-0.5430062, -1.884033, -2.963345, 1, 0, 0, 1, 1,
-0.5406417, 0.3492675, -1.245655, 1, 0, 0, 1, 1,
-0.5318086, 0.6366533, 0.1532074, 1, 0, 0, 1, 1,
-0.5318031, 0.4941362, 0.394565, 1, 0, 0, 1, 1,
-0.5233208, -1.393473, -1.584583, 0, 0, 0, 1, 1,
-0.5161558, 0.04940961, 0.1772965, 0, 0, 0, 1, 1,
-0.5146262, 0.840567, -1.329518, 0, 0, 0, 1, 1,
-0.5099997, -0.6896321, -3.038728, 0, 0, 0, 1, 1,
-0.5083335, -1.148926, -2.663496, 0, 0, 0, 1, 1,
-0.5074606, -0.7765875, -1.19293, 0, 0, 0, 1, 1,
-0.507104, 0.2286583, -3.285068, 0, 0, 0, 1, 1,
-0.5066761, 1.014942, 0.3471765, 1, 1, 1, 1, 1,
-0.5064619, 0.159305, -1.753992, 1, 1, 1, 1, 1,
-0.5062254, -0.5826399, -4.146797, 1, 1, 1, 1, 1,
-0.5041255, -0.4073258, -1.569078, 1, 1, 1, 1, 1,
-0.5014664, 0.2623283, -0.471741, 1, 1, 1, 1, 1,
-0.500653, 0.271586, -1.156789, 1, 1, 1, 1, 1,
-0.5005251, -2.497106, -2.381269, 1, 1, 1, 1, 1,
-0.497163, -1.78168, -3.117816, 1, 1, 1, 1, 1,
-0.4913494, -0.6744574, -2.688494, 1, 1, 1, 1, 1,
-0.4906003, 0.6601947, -0.7894332, 1, 1, 1, 1, 1,
-0.4878224, -0.4705217, -2.895073, 1, 1, 1, 1, 1,
-0.4868253, 0.2549967, -1.55622, 1, 1, 1, 1, 1,
-0.4833211, -0.1936254, -1.159549, 1, 1, 1, 1, 1,
-0.4779993, 0.7504482, -0.1859154, 1, 1, 1, 1, 1,
-0.4762284, -1.286307, -2.281792, 1, 1, 1, 1, 1,
-0.475455, -1.707061, -2.495466, 0, 0, 1, 1, 1,
-0.471965, -0.1028314, -2.696657, 1, 0, 0, 1, 1,
-0.4675327, 0.5315747, 1.382436, 1, 0, 0, 1, 1,
-0.4590146, -0.06749684, -2.454727, 1, 0, 0, 1, 1,
-0.4531957, 1.10345, -1.473271, 1, 0, 0, 1, 1,
-0.4438613, 1.169599, -1.227502, 1, 0, 0, 1, 1,
-0.4435652, 1.40532, 0.4430307, 0, 0, 0, 1, 1,
-0.4382509, 0.07219268, -1.174103, 0, 0, 0, 1, 1,
-0.4380078, -1.598166, -2.223636, 0, 0, 0, 1, 1,
-0.4247921, 0.1474249, -1.943177, 0, 0, 0, 1, 1,
-0.4230289, -0.9606746, -3.667943, 0, 0, 0, 1, 1,
-0.4213202, 1.554353, 1.5799, 0, 0, 0, 1, 1,
-0.4207555, 0.9299576, 1.395633, 0, 0, 0, 1, 1,
-0.4204333, -1.483477, -2.803504, 1, 1, 1, 1, 1,
-0.420357, 0.2842387, -0.1099572, 1, 1, 1, 1, 1,
-0.4182414, -0.5356343, -2.282924, 1, 1, 1, 1, 1,
-0.4142522, -2.468951, -2.100079, 1, 1, 1, 1, 1,
-0.4137133, -0.2377053, -1.523637, 1, 1, 1, 1, 1,
-0.4092804, 0.5294229, -1.608432, 1, 1, 1, 1, 1,
-0.4057274, -1.349752, -1.838967, 1, 1, 1, 1, 1,
-0.4032462, -0.5858618, -2.101703, 1, 1, 1, 1, 1,
-0.3996786, -0.09209319, -1.065121, 1, 1, 1, 1, 1,
-0.3956447, 0.9090003, 0.01569958, 1, 1, 1, 1, 1,
-0.3945879, 0.5830118, -2.109222, 1, 1, 1, 1, 1,
-0.3929115, -2.551108, -1.632795, 1, 1, 1, 1, 1,
-0.3802485, 1.802517, 1.182252, 1, 1, 1, 1, 1,
-0.3762196, -0.04175222, -2.645422, 1, 1, 1, 1, 1,
-0.372249, 1.784774, -0.06834726, 1, 1, 1, 1, 1,
-0.3707798, 1.138834, 0.07479619, 0, 0, 1, 1, 1,
-0.365531, -0.5328196, -2.937749, 1, 0, 0, 1, 1,
-0.364741, 0.6022103, -0.2335868, 1, 0, 0, 1, 1,
-0.3640463, 0.1308881, -0.7923284, 1, 0, 0, 1, 1,
-0.3578634, 0.005912408, -2.496204, 1, 0, 0, 1, 1,
-0.3498398, 1.130898, -0.1386171, 1, 0, 0, 1, 1,
-0.349739, -1.092799, -2.377483, 0, 0, 0, 1, 1,
-0.3491562, -0.2684124, -2.698353, 0, 0, 0, 1, 1,
-0.3488782, 1.388601, 1.073735, 0, 0, 0, 1, 1,
-0.34788, 0.3691611, -1.794046, 0, 0, 0, 1, 1,
-0.342275, -0.3559893, -3.459382, 0, 0, 0, 1, 1,
-0.3399041, 1.784479, -0.3766055, 0, 0, 0, 1, 1,
-0.3388226, 0.02782032, -1.465048, 0, 0, 0, 1, 1,
-0.3373718, -1.571775, -1.640828, 1, 1, 1, 1, 1,
-0.3349488, -0.1662343, -1.909153, 1, 1, 1, 1, 1,
-0.3347023, -0.8577167, -1.538649, 1, 1, 1, 1, 1,
-0.3331105, -0.8968359, -2.904366, 1, 1, 1, 1, 1,
-0.3299382, -1.536288, -3.930115, 1, 1, 1, 1, 1,
-0.3243208, 1.709808, 0.1060266, 1, 1, 1, 1, 1,
-0.3232653, -0.5966339, -2.906045, 1, 1, 1, 1, 1,
-0.322127, -0.2844271, -0.7573794, 1, 1, 1, 1, 1,
-0.3220913, 1.048353, 0.3390109, 1, 1, 1, 1, 1,
-0.3089482, -0.961447, -2.873789, 1, 1, 1, 1, 1,
-0.3067092, 0.5527407, 0.3656398, 1, 1, 1, 1, 1,
-0.303895, -0.2824181, -1.868491, 1, 1, 1, 1, 1,
-0.3000901, 0.6651608, 0.4873762, 1, 1, 1, 1, 1,
-0.2912409, -1.356166, -4.435642, 1, 1, 1, 1, 1,
-0.2898057, -1.470775, -3.973575, 1, 1, 1, 1, 1,
-0.2867313, -0.005498656, -1.419353, 0, 0, 1, 1, 1,
-0.2820202, 2.04668, -0.4172158, 1, 0, 0, 1, 1,
-0.2813974, 2.407049, -0.6837136, 1, 0, 0, 1, 1,
-0.2760985, -0.8485172, -3.395708, 1, 0, 0, 1, 1,
-0.2639416, 0.6837006, 0.05439172, 1, 0, 0, 1, 1,
-0.2613607, -1.250593, -0.8881102, 1, 0, 0, 1, 1,
-0.2607501, -0.2426905, -0.2569898, 0, 0, 0, 1, 1,
-0.2606215, 0.6753651, 0.9550472, 0, 0, 0, 1, 1,
-0.257118, -0.3184014, -3.877801, 0, 0, 0, 1, 1,
-0.2569123, -1.230249, -2.347407, 0, 0, 0, 1, 1,
-0.2566707, 0.3163354, -1.930201, 0, 0, 0, 1, 1,
-0.2549277, -1.114481, -3.730154, 0, 0, 0, 1, 1,
-0.2492858, -0.3303078, -3.397154, 0, 0, 0, 1, 1,
-0.2455314, 0.1942178, -1.577382, 1, 1, 1, 1, 1,
-0.2439923, -0.8806084, -3.371293, 1, 1, 1, 1, 1,
-0.2427453, 0.7511517, -0.5335601, 1, 1, 1, 1, 1,
-0.2349353, -0.4626894, -2.498828, 1, 1, 1, 1, 1,
-0.232502, -0.9839504, -3.376381, 1, 1, 1, 1, 1,
-0.2316928, 1.567609, 0.2522325, 1, 1, 1, 1, 1,
-0.2224376, -0.4519657, -3.214617, 1, 1, 1, 1, 1,
-0.2157163, 0.4253317, 0.3561093, 1, 1, 1, 1, 1,
-0.210552, 1.448817, -1.901794, 1, 1, 1, 1, 1,
-0.2094803, 1.657058, 0.2889625, 1, 1, 1, 1, 1,
-0.2072551, -0.7174285, -1.590479, 1, 1, 1, 1, 1,
-0.1997716, -1.676195, -1.210826, 1, 1, 1, 1, 1,
-0.1983315, -0.7676263, -2.02874, 1, 1, 1, 1, 1,
-0.1925826, 1.207077, -1.494786, 1, 1, 1, 1, 1,
-0.1922094, -0.6797837, -3.213004, 1, 1, 1, 1, 1,
-0.1871078, -0.1570291, -1.54984, 0, 0, 1, 1, 1,
-0.1862253, 1.141417, -0.4596676, 1, 0, 0, 1, 1,
-0.1793397, -0.8113433, -2.093828, 1, 0, 0, 1, 1,
-0.1745572, -0.8641837, -3.563361, 1, 0, 0, 1, 1,
-0.1742753, 1.04776, -0.5520759, 1, 0, 0, 1, 1,
-0.1725907, -0.7325314, -2.190346, 1, 0, 0, 1, 1,
-0.1715548, 1.421346, -2.714914, 0, 0, 0, 1, 1,
-0.1705157, -0.9698074, -3.356747, 0, 0, 0, 1, 1,
-0.1686426, 0.7751691, -0.6294939, 0, 0, 0, 1, 1,
-0.1663661, 0.3984209, -2.504645, 0, 0, 0, 1, 1,
-0.1651293, -1.418943, -2.272122, 0, 0, 0, 1, 1,
-0.1650859, 2.025666, 1.080295, 0, 0, 0, 1, 1,
-0.1640722, -0.9403606, -2.16097, 0, 0, 0, 1, 1,
-0.1579759, 0.005031576, -2.770432, 1, 1, 1, 1, 1,
-0.1574069, -0.301939, -2.416807, 1, 1, 1, 1, 1,
-0.1572426, 0.9673395, -0.4894647, 1, 1, 1, 1, 1,
-0.154978, -0.5425794, -1.861159, 1, 1, 1, 1, 1,
-0.1546738, -0.03845018, -3.48, 1, 1, 1, 1, 1,
-0.153046, 1.370097, 0.3135237, 1, 1, 1, 1, 1,
-0.149571, 0.2542107, -1.051677, 1, 1, 1, 1, 1,
-0.1383861, -0.1789295, -5.169824, 1, 1, 1, 1, 1,
-0.1264179, -0.930205, -1.49494, 1, 1, 1, 1, 1,
-0.1255382, -2.574451, -2.681163, 1, 1, 1, 1, 1,
-0.1247912, -0.9141905, -2.896816, 1, 1, 1, 1, 1,
-0.1233448, -0.1254762, -2.584949, 1, 1, 1, 1, 1,
-0.1233223, -1.155613, -1.877302, 1, 1, 1, 1, 1,
-0.1150865, -1.266937, -3.51197, 1, 1, 1, 1, 1,
-0.1130356, 0.2678452, 0.3544632, 1, 1, 1, 1, 1,
-0.1123414, 0.9090926, -0.5419961, 0, 0, 1, 1, 1,
-0.1121826, -0.08399341, 0.03640032, 1, 0, 0, 1, 1,
-0.1091813, 2.666396, 0.3389541, 1, 0, 0, 1, 1,
-0.1090832, -0.3206524, -3.781172, 1, 0, 0, 1, 1,
-0.1073087, -0.215859, -2.271015, 1, 0, 0, 1, 1,
-0.1041479, -0.3653273, -1.729583, 1, 0, 0, 1, 1,
-0.103589, -0.1423958, -2.997842, 0, 0, 0, 1, 1,
-0.1017116, 0.03292776, -1.294956, 0, 0, 0, 1, 1,
-0.1007515, 0.6702665, -2.089938, 0, 0, 0, 1, 1,
-0.0997505, 1.794595, -1.257182, 0, 0, 0, 1, 1,
-0.09453033, -0.6442197, -1.52326, 0, 0, 0, 1, 1,
-0.09033591, -1.195257, -3.421462, 0, 0, 0, 1, 1,
-0.08993382, -0.3723324, -2.372701, 0, 0, 0, 1, 1,
-0.08617362, 2.824749, -1.066042, 1, 1, 1, 1, 1,
-0.07903709, 0.01061851, -0.8429896, 1, 1, 1, 1, 1,
-0.0785743, 0.8674855, -0.4614, 1, 1, 1, 1, 1,
-0.07554788, -0.1640122, -2.540009, 1, 1, 1, 1, 1,
-0.07285964, 0.8726574, -1.413169, 1, 1, 1, 1, 1,
-0.07262908, -0.751681, -2.335417, 1, 1, 1, 1, 1,
-0.07036918, 0.01528139, -4.229481, 1, 1, 1, 1, 1,
-0.0688251, 0.008293507, -1.093104, 1, 1, 1, 1, 1,
-0.06238782, -0.4629734, -4.044695, 1, 1, 1, 1, 1,
-0.05965441, -1.6806, -2.71573, 1, 1, 1, 1, 1,
-0.05894363, 0.7647674, -0.1030078, 1, 1, 1, 1, 1,
-0.05832799, -2.023627, -3.594711, 1, 1, 1, 1, 1,
-0.05646218, -0.4870561, -4.613968, 1, 1, 1, 1, 1,
-0.05373564, -0.5302657, -3.929185, 1, 1, 1, 1, 1,
-0.05023272, 0.9484502, -0.6527329, 1, 1, 1, 1, 1,
-0.04996019, 0.5907733, 0.3282812, 0, 0, 1, 1, 1,
-0.04807879, -0.829572, -2.155016, 1, 0, 0, 1, 1,
-0.04804641, -0.9799606, -3.701239, 1, 0, 0, 1, 1,
-0.04804542, 0.6961137, 1.135925, 1, 0, 0, 1, 1,
-0.04491789, -1.308166, -5.375267, 1, 0, 0, 1, 1,
-0.0398689, 0.2117466, 1.863959, 1, 0, 0, 1, 1,
-0.03543189, 1.302443, 0.6732648, 0, 0, 0, 1, 1,
-0.03487185, -1.100348, -3.099975, 0, 0, 0, 1, 1,
-0.03386493, -1.193374, -4.03384, 0, 0, 0, 1, 1,
-0.03217876, -1.636653, -2.732911, 0, 0, 0, 1, 1,
-0.03119787, -3.121381, -0.8605225, 0, 0, 0, 1, 1,
-0.02767196, 0.5602722, -0.05974323, 0, 0, 0, 1, 1,
-0.02322363, -1.487066, -3.348434, 0, 0, 0, 1, 1,
-0.02002774, -2.073107, -3.542562, 1, 1, 1, 1, 1,
-0.01610086, -0.1915041, -1.727672, 1, 1, 1, 1, 1,
-0.01579492, 0.7080659, -0.2841493, 1, 1, 1, 1, 1,
-0.01414122, -1.032593, -1.255101, 1, 1, 1, 1, 1,
-0.01242695, 1.866637, 0.4157212, 1, 1, 1, 1, 1,
-0.0113654, 1.136583, -0.20946, 1, 1, 1, 1, 1,
-0.01074224, -0.05371654, -2.257677, 1, 1, 1, 1, 1,
-0.01070283, -0.6340199, -5.170703, 1, 1, 1, 1, 1,
-0.007519537, -0.4576754, -4.010492, 1, 1, 1, 1, 1,
-0.002375981, -0.6807987, -3.645577, 1, 1, 1, 1, 1,
-0.002097191, -0.5216452, -1.737794, 1, 1, 1, 1, 1,
-0.001234432, -0.6773429, -3.657803, 1, 1, 1, 1, 1,
0.001865156, 1.210385, 0.9541338, 1, 1, 1, 1, 1,
0.005026029, -1.21577, 4.033328, 1, 1, 1, 1, 1,
0.005232988, 0.4889868, -0.6121699, 1, 1, 1, 1, 1,
0.006365114, 0.1978867, 0.5762693, 0, 0, 1, 1, 1,
0.007096404, 0.2721922, -2.467835, 1, 0, 0, 1, 1,
0.007373916, -1.214513, 2.651317, 1, 0, 0, 1, 1,
0.007404876, 0.4840644, 0.5321208, 1, 0, 0, 1, 1,
0.008199852, -1.156697, 1.610069, 1, 0, 0, 1, 1,
0.008929163, -1.019935, 3.690152, 1, 0, 0, 1, 1,
0.01866643, -1.114266, 4.921369, 0, 0, 0, 1, 1,
0.02100893, 1.370623, 0.8463818, 0, 0, 0, 1, 1,
0.02174484, -1.326984, 3.721012, 0, 0, 0, 1, 1,
0.02957959, 0.1824408, -1.093654, 0, 0, 0, 1, 1,
0.03003546, 0.6309879, 0.2615071, 0, 0, 0, 1, 1,
0.03390492, -0.6429948, 4.407637, 0, 0, 0, 1, 1,
0.03580105, -0.6621999, 1.787721, 0, 0, 0, 1, 1,
0.03582681, -1.385505, 2.166505, 1, 1, 1, 1, 1,
0.03801544, 0.3855534, 1.225741, 1, 1, 1, 1, 1,
0.04136619, -0.07302856, 4.068539, 1, 1, 1, 1, 1,
0.04273891, -0.6821265, 3.511221, 1, 1, 1, 1, 1,
0.04717885, -0.8202429, 3.262751, 1, 1, 1, 1, 1,
0.05079927, 0.008067549, 0.6503181, 1, 1, 1, 1, 1,
0.05559537, 0.2853477, 0.3604676, 1, 1, 1, 1, 1,
0.06200419, 0.4678617, 0.3566224, 1, 1, 1, 1, 1,
0.06289386, -0.4883776, 1.932602, 1, 1, 1, 1, 1,
0.06392805, 0.7800167, 1.018339, 1, 1, 1, 1, 1,
0.07089954, 0.902379, -1.685251, 1, 1, 1, 1, 1,
0.07130004, 2.022674, -0.07923092, 1, 1, 1, 1, 1,
0.07928107, 0.1160946, 0.06975532, 1, 1, 1, 1, 1,
0.07940328, 1.022261, 0.2671143, 1, 1, 1, 1, 1,
0.08517907, -0.4110088, 3.531809, 1, 1, 1, 1, 1,
0.08750645, 0.6203492, 2.091921, 0, 0, 1, 1, 1,
0.08843321, 0.1868603, -2.142724, 1, 0, 0, 1, 1,
0.08959498, 0.927424, -1.017925, 1, 0, 0, 1, 1,
0.09191197, -0.2513234, 2.515301, 1, 0, 0, 1, 1,
0.09451241, -1.436228, 2.022732, 1, 0, 0, 1, 1,
0.09464062, -0.3682214, 3.265404, 1, 0, 0, 1, 1,
0.09510063, 1.30156, -1.0331, 0, 0, 0, 1, 1,
0.09845049, 2.33773, 0.5235979, 0, 0, 0, 1, 1,
0.09879768, -1.387584, 3.428087, 0, 0, 0, 1, 1,
0.1057343, -0.112964, 2.061617, 0, 0, 0, 1, 1,
0.106325, 2.071464, -0.2943277, 0, 0, 0, 1, 1,
0.1067251, -0.8917071, 3.32486, 0, 0, 0, 1, 1,
0.1109336, -0.8977432, 2.201972, 0, 0, 0, 1, 1,
0.1124475, -0.06888318, 1.318556, 1, 1, 1, 1, 1,
0.1135087, -1.155685, 4.017729, 1, 1, 1, 1, 1,
0.1145254, 0.8008621, -0.1353416, 1, 1, 1, 1, 1,
0.1215609, 0.1017379, 1.52074, 1, 1, 1, 1, 1,
0.1221671, 0.7093194, -1.862109, 1, 1, 1, 1, 1,
0.1223476, 0.5767893, 0.1419614, 1, 1, 1, 1, 1,
0.125373, -0.7986423, 2.831421, 1, 1, 1, 1, 1,
0.1276142, -1.126192, 2.389131, 1, 1, 1, 1, 1,
0.1292805, -0.13175, 1.988146, 1, 1, 1, 1, 1,
0.1295972, -0.9958149, 3.142792, 1, 1, 1, 1, 1,
0.1304473, -0.739931, 3.155329, 1, 1, 1, 1, 1,
0.1365107, 0.9060525, 0.2193586, 1, 1, 1, 1, 1,
0.1376827, -0.9524177, 3.968993, 1, 1, 1, 1, 1,
0.1417582, -1.047738, 3.849106, 1, 1, 1, 1, 1,
0.1427912, 0.2417417, 1.945357, 1, 1, 1, 1, 1,
0.1442718, 0.941685, -1.351599, 0, 0, 1, 1, 1,
0.1518293, -0.2375225, 1.986605, 1, 0, 0, 1, 1,
0.1523398, 0.2072807, 1.339652, 1, 0, 0, 1, 1,
0.152516, -1.333809, 3.978724, 1, 0, 0, 1, 1,
0.1595427, 0.817877, 1.051498, 1, 0, 0, 1, 1,
0.1621329, 1.469501, 1.073638, 1, 0, 0, 1, 1,
0.1657772, -0.9371325, 1.448647, 0, 0, 0, 1, 1,
0.166709, 1.261957, 0.3972445, 0, 0, 0, 1, 1,
0.1699591, 1.880628, -0.4994539, 0, 0, 0, 1, 1,
0.1714349, 1.391049, 0.546755, 0, 0, 0, 1, 1,
0.1858264, 1.91917, -0.951825, 0, 0, 0, 1, 1,
0.1876894, -0.1091169, 0.1105588, 0, 0, 0, 1, 1,
0.1900699, -0.572098, 3.072197, 0, 0, 0, 1, 1,
0.1928078, -0.3065882, 4.088731, 1, 1, 1, 1, 1,
0.1972956, -0.7588698, 4.588402, 1, 1, 1, 1, 1,
0.2013341, -0.2651311, 2.551228, 1, 1, 1, 1, 1,
0.2032617, -0.3446485, 2.77773, 1, 1, 1, 1, 1,
0.2053758, 0.8949474, 0.2000435, 1, 1, 1, 1, 1,
0.2103786, 0.6580501, 0.09302579, 1, 1, 1, 1, 1,
0.2114242, 0.8179332, 2.127022, 1, 1, 1, 1, 1,
0.2116277, -0.8905038, 3.735598, 1, 1, 1, 1, 1,
0.2124817, -1.37078, 4.379562, 1, 1, 1, 1, 1,
0.2187925, 0.160403, 0.3104323, 1, 1, 1, 1, 1,
0.2306496, -0.235457, 1.772865, 1, 1, 1, 1, 1,
0.2338364, 1.106251, 2.18542, 1, 1, 1, 1, 1,
0.2345169, -0.4595326, 1.935396, 1, 1, 1, 1, 1,
0.2350062, 0.04364777, 1.202134, 1, 1, 1, 1, 1,
0.2380319, -0.5640696, 3.189437, 1, 1, 1, 1, 1,
0.2398306, 0.3665249, -0.2374566, 0, 0, 1, 1, 1,
0.2403137, -0.7519798, 2.44024, 1, 0, 0, 1, 1,
0.2419377, -0.3468653, 1.773879, 1, 0, 0, 1, 1,
0.2425814, -0.009497896, 0.0783048, 1, 0, 0, 1, 1,
0.2435673, -1.29125, 4.086347, 1, 0, 0, 1, 1,
0.2490415, 0.06873452, 0.2512408, 1, 0, 0, 1, 1,
0.2539987, 0.2402535, 1.058565, 0, 0, 0, 1, 1,
0.2557876, -1.318192, 2.556504, 0, 0, 0, 1, 1,
0.2587116, -1.250039, 1.617703, 0, 0, 0, 1, 1,
0.2665296, -0.2677708, 2.142247, 0, 0, 0, 1, 1,
0.2681592, -0.141699, 2.315524, 0, 0, 0, 1, 1,
0.2712956, 0.6152419, 0.05899369, 0, 0, 0, 1, 1,
0.2721882, 1.086085, 1.02491, 0, 0, 0, 1, 1,
0.2786846, 0.6334666, -1.057581, 1, 1, 1, 1, 1,
0.2813918, 1.128821, 0.404731, 1, 1, 1, 1, 1,
0.2968954, -1.137363, 3.741806, 1, 1, 1, 1, 1,
0.3041219, -1.305499, 5.176227, 1, 1, 1, 1, 1,
0.3057046, 0.06283058, 2.36638, 1, 1, 1, 1, 1,
0.3085528, -1.243212, 3.200153, 1, 1, 1, 1, 1,
0.3104687, 1.315754, -0.6321229, 1, 1, 1, 1, 1,
0.3135651, 0.4269721, 1.336956, 1, 1, 1, 1, 1,
0.3176625, 0.1456313, 2.006341, 1, 1, 1, 1, 1,
0.3235191, -1.587356, 2.993278, 1, 1, 1, 1, 1,
0.3243355, 1.105789, 0.3801956, 1, 1, 1, 1, 1,
0.3251283, -0.4688807, 2.76624, 1, 1, 1, 1, 1,
0.3264186, 1.007034, -0.9738837, 1, 1, 1, 1, 1,
0.3279072, 1.109344, -1.056895, 1, 1, 1, 1, 1,
0.3281092, 0.7619749, 1.239088, 1, 1, 1, 1, 1,
0.3310895, 0.3959589, 1.830504, 0, 0, 1, 1, 1,
0.3311149, -0.4432864, 3.593498, 1, 0, 0, 1, 1,
0.3341584, 1.066413, 1.239431, 1, 0, 0, 1, 1,
0.3346243, -0.8434584, 4.680781, 1, 0, 0, 1, 1,
0.3365335, 1.416721, -0.3446497, 1, 0, 0, 1, 1,
0.3380133, 0.9135041, 1.681784, 1, 0, 0, 1, 1,
0.3388997, 0.4199566, -0.8760874, 0, 0, 0, 1, 1,
0.3443139, -0.9517711, 2.67112, 0, 0, 0, 1, 1,
0.3497791, 0.4696906, -1.446456, 0, 0, 0, 1, 1,
0.3503642, 0.2973256, 1.676647, 0, 0, 0, 1, 1,
0.3517487, 0.9093786, 1.924447, 0, 0, 0, 1, 1,
0.3538734, -0.9916169, 1.107326, 0, 0, 0, 1, 1,
0.3561648, 0.02179164, 1.657143, 0, 0, 0, 1, 1,
0.3564953, 0.03073961, 0.8099174, 1, 1, 1, 1, 1,
0.3599499, 0.1349419, 2.324196, 1, 1, 1, 1, 1,
0.3607303, 1.177561, 0.7681484, 1, 1, 1, 1, 1,
0.3609081, -0.8849391, 2.361393, 1, 1, 1, 1, 1,
0.3610058, 0.01572308, 1.494628, 1, 1, 1, 1, 1,
0.3625319, 0.8562361, 0.8802508, 1, 1, 1, 1, 1,
0.3628783, -1.269408, 3.715073, 1, 1, 1, 1, 1,
0.3634408, 0.305741, -0.3536447, 1, 1, 1, 1, 1,
0.365144, -1.305717, 3.255783, 1, 1, 1, 1, 1,
0.3672144, 0.9174911, 0.6112785, 1, 1, 1, 1, 1,
0.3774331, 0.9429883, 0.4864542, 1, 1, 1, 1, 1,
0.3787721, -0.3583457, 3.730362, 1, 1, 1, 1, 1,
0.3798288, 0.7692952, 1.698584, 1, 1, 1, 1, 1,
0.3858952, 1.406946, -0.03365583, 1, 1, 1, 1, 1,
0.3932029, 0.7244774, -0.195836, 1, 1, 1, 1, 1,
0.3980452, -0.3492621, 2.442524, 0, 0, 1, 1, 1,
0.3989803, -0.01873918, 1.759424, 1, 0, 0, 1, 1,
0.3991302, -1.450922, 3.238993, 1, 0, 0, 1, 1,
0.3995163, -1.53261, 2.981541, 1, 0, 0, 1, 1,
0.4020499, -0.1477662, 3.568081, 1, 0, 0, 1, 1,
0.4024455, -0.1033053, 1.349303, 1, 0, 0, 1, 1,
0.4027949, -1.181234, 2.58417, 0, 0, 0, 1, 1,
0.4028592, 0.7730541, 1.093865, 0, 0, 0, 1, 1,
0.4031947, 1.924339, 0.1158859, 0, 0, 0, 1, 1,
0.4046692, 1.986736, 1.444992, 0, 0, 0, 1, 1,
0.4046874, 0.1227223, 3.75228, 0, 0, 0, 1, 1,
0.4067816, 0.5407751, 2.279959, 0, 0, 0, 1, 1,
0.4069761, 1.162549, 1.053832, 0, 0, 0, 1, 1,
0.4078946, -1.771711, 4.619395, 1, 1, 1, 1, 1,
0.4136569, -1.273098, 2.988155, 1, 1, 1, 1, 1,
0.4148547, 2.322347, -0.4410116, 1, 1, 1, 1, 1,
0.4150208, -0.5033953, 1.481281, 1, 1, 1, 1, 1,
0.4166448, 3.068496, 0.2267783, 1, 1, 1, 1, 1,
0.4178917, 0.9441432, -0.01351056, 1, 1, 1, 1, 1,
0.4181076, 0.641522, 2.159511, 1, 1, 1, 1, 1,
0.4181108, -0.2765309, 3.446364, 1, 1, 1, 1, 1,
0.418501, -0.7221701, 1.267962, 1, 1, 1, 1, 1,
0.4212291, 1.032344, 1.210063, 1, 1, 1, 1, 1,
0.4212624, -0.7028276, 2.93681, 1, 1, 1, 1, 1,
0.4213108, 0.3457254, 1.919427, 1, 1, 1, 1, 1,
0.424767, -1.495321, 2.56092, 1, 1, 1, 1, 1,
0.4276359, -0.9793158, 4.175107, 1, 1, 1, 1, 1,
0.4277253, 0.07618356, 1.709245, 1, 1, 1, 1, 1,
0.4281021, 0.9287241, -0.2131999, 0, 0, 1, 1, 1,
0.4298179, 0.3651527, 0.3860925, 1, 0, 0, 1, 1,
0.4314592, -1.013128, 2.361709, 1, 0, 0, 1, 1,
0.4328912, 2.040975, 2.307163, 1, 0, 0, 1, 1,
0.4360133, -0.1135931, 1.122959, 1, 0, 0, 1, 1,
0.4367713, 0.1452168, 2.455822, 1, 0, 0, 1, 1,
0.4404368, 1.80455, 1.387187, 0, 0, 0, 1, 1,
0.4473085, 0.00254411, 1.422866, 0, 0, 0, 1, 1,
0.451003, 0.03187114, 0.3119985, 0, 0, 0, 1, 1,
0.4513717, 0.135381, 1.454889, 0, 0, 0, 1, 1,
0.4561581, -1.601282, 3.26609, 0, 0, 0, 1, 1,
0.4570781, 0.600367, 0.2141272, 0, 0, 0, 1, 1,
0.4676509, 0.06719665, 3.135369, 0, 0, 0, 1, 1,
0.4690655, 0.56337, 0.7656224, 1, 1, 1, 1, 1,
0.4738472, -1.483432, 2.008965, 1, 1, 1, 1, 1,
0.4744348, 0.7274917, 0.3188803, 1, 1, 1, 1, 1,
0.4746077, 1.77834, -0.2099379, 1, 1, 1, 1, 1,
0.475067, 1.182506, 0.04753187, 1, 1, 1, 1, 1,
0.4752838, -2.052534, 3.587586, 1, 1, 1, 1, 1,
0.476141, -0.1922564, 3.383149, 1, 1, 1, 1, 1,
0.4785382, -0.8006941, 3.752274, 1, 1, 1, 1, 1,
0.4807611, 0.8424037, 0.6207512, 1, 1, 1, 1, 1,
0.4850342, 1.436986, -0.3413768, 1, 1, 1, 1, 1,
0.4890073, -1.685071, 3.132156, 1, 1, 1, 1, 1,
0.489915, -0.1266591, 2.409374, 1, 1, 1, 1, 1,
0.4932779, -0.2727578, 2.354553, 1, 1, 1, 1, 1,
0.5003186, -0.7455437, 1.37389, 1, 1, 1, 1, 1,
0.500452, 0.3122617, 1.024145, 1, 1, 1, 1, 1,
0.5064337, 0.9399209, 1.046655, 0, 0, 1, 1, 1,
0.5073233, 0.7422301, -0.2165346, 1, 0, 0, 1, 1,
0.5092002, -0.8649664, 1.947157, 1, 0, 0, 1, 1,
0.5108534, -0.1365102, 1.160509, 1, 0, 0, 1, 1,
0.511823, 0.1503987, 2.106548, 1, 0, 0, 1, 1,
0.5132352, -0.1901839, 2.1805, 1, 0, 0, 1, 1,
0.5141534, 0.8663083, 0.2715086, 0, 0, 0, 1, 1,
0.51547, -1.320705, 3.66904, 0, 0, 0, 1, 1,
0.5258183, 1.16985, 0.02501441, 0, 0, 0, 1, 1,
0.5268812, -1.161643, 3.496231, 0, 0, 0, 1, 1,
0.5287054, 0.7698918, 0.857272, 0, 0, 0, 1, 1,
0.5336939, 0.278864, 0.394644, 0, 0, 0, 1, 1,
0.5356189, 0.1834299, 1.013771, 0, 0, 0, 1, 1,
0.5368791, 0.3880309, -0.6706901, 1, 1, 1, 1, 1,
0.5382532, 1.062668, 1.238325, 1, 1, 1, 1, 1,
0.5386387, 0.3186614, -0.4249896, 1, 1, 1, 1, 1,
0.5399505, -0.3957635, 3.855554, 1, 1, 1, 1, 1,
0.5463731, -0.9870215, 1.492174, 1, 1, 1, 1, 1,
0.5463948, -0.686177, 1.173319, 1, 1, 1, 1, 1,
0.550589, 0.416791, 0.9416499, 1, 1, 1, 1, 1,
0.5598059, 0.05496345, 1.164119, 1, 1, 1, 1, 1,
0.5600484, 0.9387855, 0.3331329, 1, 1, 1, 1, 1,
0.5607815, 0.03668211, 1.74049, 1, 1, 1, 1, 1,
0.5609113, 1.343232, -0.05791904, 1, 1, 1, 1, 1,
0.5626654, 0.2958493, 0.9413887, 1, 1, 1, 1, 1,
0.5645186, 0.816161, 2.830618, 1, 1, 1, 1, 1,
0.5706099, 0.7096549, 0.1554145, 1, 1, 1, 1, 1,
0.570975, 1.508906, 0.4127494, 1, 1, 1, 1, 1,
0.5731177, -0.710703, 2.264167, 0, 0, 1, 1, 1,
0.5741322, 1.069824, 0.4064791, 1, 0, 0, 1, 1,
0.5762642, 0.5609773, 1.084213, 1, 0, 0, 1, 1,
0.576977, -0.1372989, 2.014794, 1, 0, 0, 1, 1,
0.5799373, -0.09681418, 1.316756, 1, 0, 0, 1, 1,
0.5803231, 0.3015062, 0.4901206, 1, 0, 0, 1, 1,
0.5952585, 1.58726, 0.4232799, 0, 0, 0, 1, 1,
0.5953977, 1.982989, -0.2217645, 0, 0, 0, 1, 1,
0.5997623, -1.447675, 2.557322, 0, 0, 0, 1, 1,
0.5998092, -0.3021246, 3.636894, 0, 0, 0, 1, 1,
0.6102327, 0.009101743, 1.114304, 0, 0, 0, 1, 1,
0.6130357, 0.3709527, 1.600094, 0, 0, 0, 1, 1,
0.6148657, 0.1277087, 2.563644, 0, 0, 0, 1, 1,
0.6157416, -0.1487424, 2.257678, 1, 1, 1, 1, 1,
0.6185734, 1.910979, -0.2543882, 1, 1, 1, 1, 1,
0.6202016, -0.7862339, 1.976446, 1, 1, 1, 1, 1,
0.6247266, 0.5014516, -0.843163, 1, 1, 1, 1, 1,
0.6273699, 0.3332892, 0.5536823, 1, 1, 1, 1, 1,
0.6303672, -0.1646277, 1.377714, 1, 1, 1, 1, 1,
0.6358178, -0.4474534, 2.94524, 1, 1, 1, 1, 1,
0.6405733, -0.6764465, 2.049703, 1, 1, 1, 1, 1,
0.6488794, -0.6322387, 2.881253, 1, 1, 1, 1, 1,
0.6518517, -1.5863, 3.329237, 1, 1, 1, 1, 1,
0.6527697, -0.2386391, 2.771047, 1, 1, 1, 1, 1,
0.6531484, -0.1367827, 2.235002, 1, 1, 1, 1, 1,
0.6540179, 0.6473077, 0.8277466, 1, 1, 1, 1, 1,
0.6574283, -0.756124, 2.65919, 1, 1, 1, 1, 1,
0.6576832, 0.9537452, -0.4622909, 1, 1, 1, 1, 1,
0.6604778, -1.057646, 3.249252, 0, 0, 1, 1, 1,
0.6611209, 0.4471664, 1.03173, 1, 0, 0, 1, 1,
0.6614494, 0.4610462, 1.025544, 1, 0, 0, 1, 1,
0.6639577, 1.085994, -0.08390907, 1, 0, 0, 1, 1,
0.6652256, 0.1575971, 1.225651, 1, 0, 0, 1, 1,
0.6667339, 1.478811, 1.487016, 1, 0, 0, 1, 1,
0.6701152, 1.344359, 1.374445, 0, 0, 0, 1, 1,
0.6705515, -1.073005, 1.777815, 0, 0, 0, 1, 1,
0.6738379, -0.04102397, 2.953991, 0, 0, 0, 1, 1,
0.6751837, 0.4971385, -0.08856937, 0, 0, 0, 1, 1,
0.6796514, -0.5014134, 1.325492, 0, 0, 0, 1, 1,
0.684055, -0.6631142, 2.521963, 0, 0, 0, 1, 1,
0.6847873, 0.2932659, 2.364936, 0, 0, 0, 1, 1,
0.6888276, 0.9279706, 1.823037, 1, 1, 1, 1, 1,
0.6983528, -0.6269714, 2.687623, 1, 1, 1, 1, 1,
0.6985672, -0.6909423, 0.5610359, 1, 1, 1, 1, 1,
0.7117602, -1.226778, 3.579163, 1, 1, 1, 1, 1,
0.7150453, -0.416601, 1.987278, 1, 1, 1, 1, 1,
0.7155316, 1.666632, 0.6462845, 1, 1, 1, 1, 1,
0.7295727, 1.497288, 1.076145, 1, 1, 1, 1, 1,
0.7302803, 0.5493065, 3.422704, 1, 1, 1, 1, 1,
0.7314243, 0.08153411, 1.723451, 1, 1, 1, 1, 1,
0.7404206, 1.280809, 0.384477, 1, 1, 1, 1, 1,
0.7441933, -1.221185, 1.857276, 1, 1, 1, 1, 1,
0.7450014, -0.9119583, 3.113245, 1, 1, 1, 1, 1,
0.7470078, -0.788179, 2.614702, 1, 1, 1, 1, 1,
0.7479388, 0.5127507, 0.7245668, 1, 1, 1, 1, 1,
0.7501076, 0.972801, 2.434281, 1, 1, 1, 1, 1,
0.7578831, 0.4131674, -0.7189469, 0, 0, 1, 1, 1,
0.7580285, -0.3528811, 0.6679956, 1, 0, 0, 1, 1,
0.7595178, -1.098597, 3.27299, 1, 0, 0, 1, 1,
0.7648028, 0.6474089, 1.285296, 1, 0, 0, 1, 1,
0.7661285, 0.1243489, 1.959499, 1, 0, 0, 1, 1,
0.7661777, -0.1759115, 1.952144, 1, 0, 0, 1, 1,
0.7785774, -1.603464, 1.49252, 0, 0, 0, 1, 1,
0.7906424, 0.03688824, 1.949654, 0, 0, 0, 1, 1,
0.7916602, 0.7679383, 0.9008969, 0, 0, 0, 1, 1,
0.7923786, -0.2290466, 1.312798, 0, 0, 0, 1, 1,
0.7987869, 0.6078979, 1.259066, 0, 0, 0, 1, 1,
0.7992725, 0.9269211, 1.214192, 0, 0, 0, 1, 1,
0.8160166, 1.201229, 0.9990264, 0, 0, 0, 1, 1,
0.8189211, -0.4768224, 1.632691, 1, 1, 1, 1, 1,
0.8274614, 0.8016463, -0.5139171, 1, 1, 1, 1, 1,
0.8277416, 1.22365, 0.9888184, 1, 1, 1, 1, 1,
0.8283215, 0.02884486, 0.2838107, 1, 1, 1, 1, 1,
0.8283714, -0.8774865, 4.169432, 1, 1, 1, 1, 1,
0.8334307, 1.254231, 2.077374, 1, 1, 1, 1, 1,
0.8352612, -0.01974448, 0.422484, 1, 1, 1, 1, 1,
0.8416928, 0.3755651, 1.316623, 1, 1, 1, 1, 1,
0.8442267, 1.495488, 0.6619028, 1, 1, 1, 1, 1,
0.8443333, -0.8556785, 3.020879, 1, 1, 1, 1, 1,
0.8470822, 0.3268246, 0.1591295, 1, 1, 1, 1, 1,
0.8480652, 1.360049, 0.6138163, 1, 1, 1, 1, 1,
0.8579058, -0.3143131, 0.0904206, 1, 1, 1, 1, 1,
0.8586017, 0.5157935, 2.39388, 1, 1, 1, 1, 1,
0.8603505, -0.4291577, 1.968505, 1, 1, 1, 1, 1,
0.86203, 1.05482, -0.123119, 0, 0, 1, 1, 1,
0.8757834, -1.321809, 1.831902, 1, 0, 0, 1, 1,
0.8772129, -1.047916, 3.687047, 1, 0, 0, 1, 1,
0.8856182, -2.446295, 2.684578, 1, 0, 0, 1, 1,
0.8907174, -0.4800351, 1.390594, 1, 0, 0, 1, 1,
0.8928877, -0.01011581, 1.16383, 1, 0, 0, 1, 1,
0.8947908, -0.3860297, 3.272437, 0, 0, 0, 1, 1,
0.8952565, -0.6690594, 2.616489, 0, 0, 0, 1, 1,
0.8968937, 2.139072, 0.5730377, 0, 0, 0, 1, 1,
0.8973225, -0.5969033, 2.159726, 0, 0, 0, 1, 1,
0.8994513, -0.3041338, 1.48463, 0, 0, 0, 1, 1,
0.9000171, 1.111292, 1.112387, 0, 0, 0, 1, 1,
0.9004274, 0.685748, 0.7069028, 0, 0, 0, 1, 1,
0.9023896, -1.671299, 2.664534, 1, 1, 1, 1, 1,
0.9063764, -0.1260305, 1.636605, 1, 1, 1, 1, 1,
0.9078583, 0.4811555, 1.861047, 1, 1, 1, 1, 1,
0.9223803, 0.06350347, 0.772723, 1, 1, 1, 1, 1,
0.9226379, -0.9356819, 2.027283, 1, 1, 1, 1, 1,
0.9305935, 0.5873884, 1.938127, 1, 1, 1, 1, 1,
0.9343358, 1.812413, 0.7549663, 1, 1, 1, 1, 1,
0.9353532, -0.08011921, 2.73518, 1, 1, 1, 1, 1,
0.9404182, -0.8422737, 2.20304, 1, 1, 1, 1, 1,
0.9445742, 0.4409318, 2.749555, 1, 1, 1, 1, 1,
0.9527749, 0.666312, 1.24554, 1, 1, 1, 1, 1,
0.9624664, 0.8592011, 0.2436582, 1, 1, 1, 1, 1,
0.9689024, 1.076268, 1.044105, 1, 1, 1, 1, 1,
0.9726797, -0.9724861, 3.025892, 1, 1, 1, 1, 1,
0.9791172, 0.9030593, 1.149399, 1, 1, 1, 1, 1,
0.9854389, -0.1010116, -0.3943905, 0, 0, 1, 1, 1,
0.9864352, -0.7957228, 0.7141799, 1, 0, 0, 1, 1,
0.989188, -1.09438, 1.039672, 1, 0, 0, 1, 1,
0.9938841, 0.5066368, 1.270071, 1, 0, 0, 1, 1,
0.996383, 0.9604462, 1.078045, 1, 0, 0, 1, 1,
1.005515, -0.04934601, 2.268782, 1, 0, 0, 1, 1,
1.016892, 1.149886, -0.57937, 0, 0, 0, 1, 1,
1.021945, 1.206398, 0.9352595, 0, 0, 0, 1, 1,
1.034481, -1.481459, 3.004126, 0, 0, 0, 1, 1,
1.036004, 0.6479065, -0.2660171, 0, 0, 0, 1, 1,
1.039489, 0.5377504, 0.6242827, 0, 0, 0, 1, 1,
1.044533, -0.9417461, 2.600167, 0, 0, 0, 1, 1,
1.049147, -0.3220043, 3.236788, 0, 0, 0, 1, 1,
1.051129, 2.03246, -0.2846127, 1, 1, 1, 1, 1,
1.051265, -0.7314059, 2.52012, 1, 1, 1, 1, 1,
1.055057, -1.165442, 3.04566, 1, 1, 1, 1, 1,
1.062038, -0.2220084, 0.4985216, 1, 1, 1, 1, 1,
1.084127, 0.6106646, 1.240774, 1, 1, 1, 1, 1,
1.085921, -1.679764, 0.1515387, 1, 1, 1, 1, 1,
1.088997, 0.1621256, 0.4365797, 1, 1, 1, 1, 1,
1.093206, -0.843633, -0.1336316, 1, 1, 1, 1, 1,
1.0956, 0.1157911, 0.876524, 1, 1, 1, 1, 1,
1.101188, -1.040852, 4.509171, 1, 1, 1, 1, 1,
1.102012, 0.06726933, 1.719961, 1, 1, 1, 1, 1,
1.102358, -1.35972, 2.665028, 1, 1, 1, 1, 1,
1.120877, 0.2323703, 0.5989563, 1, 1, 1, 1, 1,
1.123647, 0.4196521, 2.826521, 1, 1, 1, 1, 1,
1.130034, -2.114836, 2.019779, 1, 1, 1, 1, 1,
1.133839, 0.6253538, 0.8573439, 0, 0, 1, 1, 1,
1.134392, -0.3388252, 1.237204, 1, 0, 0, 1, 1,
1.144594, 0.1421678, 1.669486, 1, 0, 0, 1, 1,
1.145386, 0.5794039, 0.6977247, 1, 0, 0, 1, 1,
1.148218, 0.2363639, -0.1694132, 1, 0, 0, 1, 1,
1.148971, -0.7006437, 1.197502, 1, 0, 0, 1, 1,
1.152362, -0.3030797, 2.525985, 0, 0, 0, 1, 1,
1.172936, -0.2929651, 2.272962, 0, 0, 0, 1, 1,
1.17404, 1.99919, 0.1565177, 0, 0, 0, 1, 1,
1.174306, 0.03454904, 2.152537, 0, 0, 0, 1, 1,
1.178535, -0.5686561, 3.88921, 0, 0, 0, 1, 1,
1.18616, -2.120442, 2.662804, 0, 0, 0, 1, 1,
1.210501, -1.812165, 3.607021, 0, 0, 0, 1, 1,
1.210598, -0.06450277, 0.7509202, 1, 1, 1, 1, 1,
1.213939, -0.3203331, 1.365816, 1, 1, 1, 1, 1,
1.220058, -0.4357599, 1.662213, 1, 1, 1, 1, 1,
1.233899, -1.530319, 3.56992, 1, 1, 1, 1, 1,
1.234695, 0.8470938, 1.393295, 1, 1, 1, 1, 1,
1.234844, -0.4947459, 1.589266, 1, 1, 1, 1, 1,
1.238158, 0.6179252, 1.160722, 1, 1, 1, 1, 1,
1.242317, -0.07530751, 1.19757, 1, 1, 1, 1, 1,
1.24386, -0.1604364, 2.24458, 1, 1, 1, 1, 1,
1.248453, 0.3175417, 1.82207, 1, 1, 1, 1, 1,
1.251909, 0.1859603, 2.705953, 1, 1, 1, 1, 1,
1.252329, 0.4600931, 2.260106, 1, 1, 1, 1, 1,
1.25325, -0.1547843, 0.955399, 1, 1, 1, 1, 1,
1.258649, -0.7167608, 1.925379, 1, 1, 1, 1, 1,
1.263648, 0.142521, 2.797741, 1, 1, 1, 1, 1,
1.279842, -0.1504476, 1.098393, 0, 0, 1, 1, 1,
1.306622, -0.6425927, 1.672552, 1, 0, 0, 1, 1,
1.312311, -2.335274, 3.429662, 1, 0, 0, 1, 1,
1.31478, 0.5008044, 1.97107, 1, 0, 0, 1, 1,
1.326045, 0.314441, 0.8360512, 1, 0, 0, 1, 1,
1.326463, 0.8031565, 1.670282, 1, 0, 0, 1, 1,
1.326991, -0.1232692, 1.876108, 0, 0, 0, 1, 1,
1.334686, -0.929078, 0.7691013, 0, 0, 0, 1, 1,
1.334932, 2.056084, 0.3269353, 0, 0, 0, 1, 1,
1.335882, 0.4268548, 1.516619, 0, 0, 0, 1, 1,
1.341822, -1.559197, 3.145134, 0, 0, 0, 1, 1,
1.346577, -0.7161947, 1.549586, 0, 0, 0, 1, 1,
1.351003, 0.5213174, 2.557076, 0, 0, 0, 1, 1,
1.352101, 0.05533931, 1.314175, 1, 1, 1, 1, 1,
1.360469, 0.2992981, 1.790535, 1, 1, 1, 1, 1,
1.36622, -1.710672, 1.393605, 1, 1, 1, 1, 1,
1.370547, 0.9552296, 1.466742, 1, 1, 1, 1, 1,
1.374197, -1.220049, 2.694493, 1, 1, 1, 1, 1,
1.382559, 0.955035, 0.7171845, 1, 1, 1, 1, 1,
1.389712, -0.3670247, 2.145099, 1, 1, 1, 1, 1,
1.395006, -0.51901, 1.736059, 1, 1, 1, 1, 1,
1.404987, 1.472238, 0.3389719, 1, 1, 1, 1, 1,
1.406692, 0.6679962, -0.9818991, 1, 1, 1, 1, 1,
1.418769, -0.1275489, 2.938979, 1, 1, 1, 1, 1,
1.42722, -2.023842, 1.937154, 1, 1, 1, 1, 1,
1.439961, -0.5885183, 1.654776, 1, 1, 1, 1, 1,
1.463888, 1.416048, 1.237022, 1, 1, 1, 1, 1,
1.470677, 1.936694, 1.480919, 1, 1, 1, 1, 1,
1.477287, -0.3621112, 2.264115, 0, 0, 1, 1, 1,
1.494457, 0.4825701, -0.9449398, 1, 0, 0, 1, 1,
1.507877, -0.7451046, 2.217931, 1, 0, 0, 1, 1,
1.525579, -2.427098, 2.970843, 1, 0, 0, 1, 1,
1.526637, -0.3280709, 0.6762702, 1, 0, 0, 1, 1,
1.531052, -1.029577, 2.092796, 1, 0, 0, 1, 1,
1.545161, -0.6527202, 4.464831, 0, 0, 0, 1, 1,
1.569039, -0.3161874, 3.485454, 0, 0, 0, 1, 1,
1.569554, 1.305504, 1.920397, 0, 0, 0, 1, 1,
1.575312, -0.01299305, 3.25715, 0, 0, 0, 1, 1,
1.590208, -0.7658226, 2.429254, 0, 0, 0, 1, 1,
1.59101, 0.3730429, 0.6420399, 0, 0, 0, 1, 1,
1.595431, 0.54089, 1.271299, 0, 0, 0, 1, 1,
1.603406, 0.3367648, 0.7431665, 1, 1, 1, 1, 1,
1.614844, 0.05515311, -0.008499356, 1, 1, 1, 1, 1,
1.619068, -0.8879474, 2.813319, 1, 1, 1, 1, 1,
1.622421, -0.09077842, -1.424087, 1, 1, 1, 1, 1,
1.6296, 0.4001468, 2.057484, 1, 1, 1, 1, 1,
1.653951, 0.5009114, 3.162774, 1, 1, 1, 1, 1,
1.658462, -0.5043536, 0.06568395, 1, 1, 1, 1, 1,
1.662947, -1.726045, 1.884716, 1, 1, 1, 1, 1,
1.683838, -0.06110838, 2.185085, 1, 1, 1, 1, 1,
1.684386, -0.1545012, 2.400152, 1, 1, 1, 1, 1,
1.70466, -0.9693362, 1.210794, 1, 1, 1, 1, 1,
1.716351, 1.392748, 0.8102925, 1, 1, 1, 1, 1,
1.725883, -1.241967, 1.340647, 1, 1, 1, 1, 1,
1.730213, -0.1659957, 2.722042, 1, 1, 1, 1, 1,
1.730305, 0.4317865, 1.453824, 1, 1, 1, 1, 1,
1.737557, 1.934748, 0.3258032, 0, 0, 1, 1, 1,
1.752476, 1.593804, -0.02019495, 1, 0, 0, 1, 1,
1.754912, -0.5764806, 1.729787, 1, 0, 0, 1, 1,
1.780394, 0.3738186, -0.33295, 1, 0, 0, 1, 1,
1.793862, 2.081905, 1.400416, 1, 0, 0, 1, 1,
1.799018, -0.5168136, 2.49752, 1, 0, 0, 1, 1,
1.803085, -1.671386, 3.16595, 0, 0, 0, 1, 1,
1.803951, 0.02497979, 1.693464, 0, 0, 0, 1, 1,
1.814186, 0.6563678, 1.326255, 0, 0, 0, 1, 1,
1.838502, 0.6556914, -0.03393096, 0, 0, 0, 1, 1,
1.852022, 0.2949706, 2.697677, 0, 0, 0, 1, 1,
1.854758, 0.8719236, 0.8706854, 0, 0, 0, 1, 1,
1.856037, -1.494953, 1.886043, 0, 0, 0, 1, 1,
1.872133, 1.17395, 0.8065534, 1, 1, 1, 1, 1,
1.872712, -0.2495383, 1.66253, 1, 1, 1, 1, 1,
1.901779, -1.442427, 2.083175, 1, 1, 1, 1, 1,
1.902322, -0.8038928, 1.107839, 1, 1, 1, 1, 1,
1.939507, 1.020409, 0.595854, 1, 1, 1, 1, 1,
1.954377, -0.5643552, 1.095898, 1, 1, 1, 1, 1,
1.962967, -0.563511, 1.846538, 1, 1, 1, 1, 1,
1.962997, 0.8722901, -0.1466442, 1, 1, 1, 1, 1,
1.96568, 1.082753, -0.1278773, 1, 1, 1, 1, 1,
1.976903, 0.1848776, 1.700915, 1, 1, 1, 1, 1,
1.986408, 0.1531971, 1.121002, 1, 1, 1, 1, 1,
2.013036, -0.3213933, 1.842437, 1, 1, 1, 1, 1,
2.020988, -1.312663, 1.674837, 1, 1, 1, 1, 1,
2.041827, 0.9016696, 1.052841, 1, 1, 1, 1, 1,
2.113711, 0.6474808, 1.442454, 1, 1, 1, 1, 1,
2.114431, -0.1406177, 0.4815142, 0, 0, 1, 1, 1,
2.133764, -0.03753643, 1.14769, 1, 0, 0, 1, 1,
2.165515, 0.1734841, 1.702099, 1, 0, 0, 1, 1,
2.174361, 0.7218571, 1.97022, 1, 0, 0, 1, 1,
2.189528, -0.06233297, 1.726138, 1, 0, 0, 1, 1,
2.226875, 0.3675048, 1.583375, 1, 0, 0, 1, 1,
2.229878, 1.286368, 0.3773864, 0, 0, 0, 1, 1,
2.238382, 0.851308, 1.140478, 0, 0, 0, 1, 1,
2.363921, -0.5611854, 2.849074, 0, 0, 0, 1, 1,
2.370741, 2.889241, -0.236171, 0, 0, 0, 1, 1,
2.398209, 0.1825537, 1.701005, 0, 0, 0, 1, 1,
2.451974, -0.3569269, 2.319148, 0, 0, 0, 1, 1,
2.485512, 0.8301419, 2.53727, 0, 0, 0, 1, 1,
2.555095, 1.366357, 1.255504, 1, 1, 1, 1, 1,
2.590982, -0.2267826, 2.083006, 1, 1, 1, 1, 1,
2.685069, -0.8508859, 2.572989, 1, 1, 1, 1, 1,
2.763728, 0.08830228, 0.918278, 1, 1, 1, 1, 1,
2.808017, 0.4432319, 4.013384, 1, 1, 1, 1, 1,
3.093639, 0.7360879, 1.928705, 1, 1, 1, 1, 1,
3.15106, 1.255629, 0.6794322, 1, 1, 1, 1, 1
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
var radius = 9.480776;
var distance = 33.30083;
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
mvMatrix.translate( -0.1190698, -0.1964049, 0.09951997 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30083);
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
